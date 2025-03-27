import 'dart:async';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/core/services/shared_services.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  navigate() {
    Timer(const Duration(seconds: 5), SharedServices.checkLogin);
  }
}
