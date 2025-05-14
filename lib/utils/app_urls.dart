import 'package:qazquery/utils/config.dart';

// class AppUrls {
//   static const String apiVersion = 'v1';
//   static const String apiUrl = '${AppConfig.baseUrl}/api/$apiVersion';
//   static Uri login = Uri.parse('$apiUrl/login');
//   static Uri register = Uri.parse('$apiUrl/register');
// }

class AppUrls {
  static Uri login = Uri.parse('${AppConfig.baseUrl}/login');
  static Uri register = Uri.parse('${AppConfig.baseUrl}/register');
}
