import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qazquery/helpers/request_helpers.dart';
import 'package:qazquery/models/user_model.dart';
import 'package:qazquery/utils/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_widgets/custom_alert.dart';
import '../../utils/assets_manager.dart';

class AuthServices {
  static Future<bool> register({
    required UserModel user,
  }) async {
    final pref = await SharedPreferences.getInstance();
    final request = await http
        .post(AppUrls.register, headers: RequestHelpers.header(), body: {
      'full_name': user.fullName,
      'email': user.email,
      'username': user.username,
      'password': user.password,
    });

    print(AppUrls.register);
    print('Request status code: ${request.statusCode}');
    print('Sending registration data: ${user.toJson()}');

    if (request.statusCode == 200) {
      pref.setString('token', jsonDecode(request.body)['response']['token']);
      pref.setString('name', user.fullName!);
      return true;
    } else {
      print('Registration failed: ${request.body}');
      return false;
    }
  }

  static Future<bool> login({
    required UserModel user,
  }) async {
    final pref = await SharedPreferences.getInstance();
    final request =
        await http.post(AppUrls.login, headers: RequestHelpers.header(), body: {
      'email': user.email,
      'password': user.password,
    });

    if (request.statusCode == 200) {
      pref.setString('token', jsonDecode(request.body)['response']['token']);
      return true;
    } else {
      final decoded = jsonDecode(request.body);
      Get.dialog(
        CustomAlert(
          title: 'Error!',
          description: decoded['message'],
          buttonText: 'Try Again',
          image: AnimationManager.error,
          isAnimated: true,
        ),
        barrierDismissible: false,
      );
      return false;
    }
  }
}
