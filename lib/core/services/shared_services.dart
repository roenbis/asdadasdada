import 'package:get/get.dart';
import 'package:qazquery/helpers/auth_helper.dart';
import 'package:qazquery/routes/route_names.dart';

class SharedServices {
  static Future checkLogin() async {
    final token = await AuthHelper.getToken();

    // Check if logged in
    if (token != null) {
      Get.offAllNamed(RouteNames.home);
    } else {
      Get.offAllNamed(RouteNames.getStarted);
    }
  }

  static Future logout() async {
    AuthHelper.removeToken();
    Get.offAllNamed(RouteNames.login);
  }
}
