import 'dart:convert';
import 'dart:io';
import 'package:qazquery/models/user_model.dart';
import 'package:qazquery/helpers/database_helper.dart';

Future<void> main() async {
  final db = await DatabaseHelper().initDB();
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8000);
  print('✅ Fake Dart Server запущен на http://0.0.0.0:8000');

  await for (HttpRequest request in server) {
    final method = request.method;
    final path = request.uri.path;
    print('${DateTime.now().toIso8601String()}  $method   $path');

    if (method == 'POST' &&
        (path == '/api/v1/register' || path == '/api/v1/login')) {
      try {
        final body = await utf8.decoder.bind(request).join();
        final contentType = request.headers.contentType;
        Map<String, dynamic> data = {};

        if (contentType?.mimeType == 'application/x-www-form-urlencoded') {
          data = Uri.splitQueryString(body);
        } else if (contentType?.mimeType == 'application/json') {
          data = jsonDecode(body);
        } else {
          request.response
            ..statusCode = HttpStatus.unsupportedMediaType
            ..write(jsonEncode({'message': 'Unsupported content type'}));
          await request.response.close();
          continue;
        }

        final dbHelper = DatabaseHelper();

        if (path == '/api/v1/register') {
          final user = UserModel.fromMap(data);
          try {
            await dbHelper.insertUser(user);
            request.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.json
              ..write(jsonEncode({
                'response': {
                  'message': 'Registration successful',
                  'token': 'fake-jwt-token'
                }
              }));
          } catch (e) {
            request.response
              ..statusCode = HttpStatus.badRequest
              ..headers.contentType = ContentType.json
              ..write(
                  jsonEncode({'message': 'User already exists or invalid'}));
          }
        }

        if (path == '/api/v1/login') {
          final user = await dbHelper.getUserByEmailAndPassword(
              data['email'], data['password']);
          if (user != null) {
            request.response
              ..statusCode = HttpStatus.ok
              ..headers.contentType = ContentType.json
              ..write(jsonEncode({
                'response': {
                  'message': 'Login successful',
                  'token': 'fake-jwt-token'
                }
              }));
          } else {
            request.response
              ..statusCode = HttpStatus.unauthorized
              ..headers.contentType = ContentType.json
              ..write(jsonEncode({'message': 'Invalid credentials'}));
          }
        }
      } catch (e) {
        request.response
          ..statusCode = HttpStatus.internalServerError
          ..headers.contentType = ContentType.json
          ..write(jsonEncode(
              {'message': 'Internal server error', 'error': e.toString()}));
      } finally {
        await request.response.close();
      }
    } else {
      request.response
        ..statusCode = HttpStatus.notFound
        ..headers.contentType = ContentType.json
        ..write(jsonEncode({'message': 'Route not found'}));
      await request.response.close();
    }
  }
}
