import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qazquery/core/services/auth_services.dart';
import 'package:qazquery/models/user_model.dart';
import '../global_widgets/custom_alert.dart';
import '../routes/route_names.dart';
import '../utils/assets_manager.dart';

class RegisterController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  RxString emailError = RxString('');
  RxString confirmPasswordError = RxString('');
  final UserModel user = UserModel();
  final RxBool isLoading = false.obs;

  void validateEmail(String email) {
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailRegex);

    if (regex.hasMatch(email)) {
      emailError.value = '';
    } else {
      emailError.value = 'Электрондық пошта мекенжайы дұрыс емес';
    }
  }

  void validateConfirmPassword(String confirmPassword) {
    if (confirmPassword != user.password) {
      confirmPasswordError.value = 'Құпия сөздер бірдей емес';
    } else {
      confirmPasswordError.value = '';
    }
  }

  void register() async {
    isLoading.value = true;
    final bool isRegistered = await AuthServices.register(user: user);
    isLoading.value = false;
    update();
    if (isRegistered) {
      Get.dialog(
        CustomAlert(
          title: 'Құттықтаймыз',
          description: 'Сіз тіркеуді аяқтадыңыз!',
          buttonText: 'Жақсы естіледі!',
          image: AnimationManager.success,
          isAnimated: true,
          onButtonTap: () => Get.offAllNamed(RouteNames.home),
        ),
        barrierDismissible: false,
      );
    } else {
      Get.dialog(
        const CustomAlert(
          title: 'Қате!',
          description: 'Тіркелу кезінде бірдеңе дұрыс емес!',
          buttonText: 'Қайталап көріңіз',
          image: AnimationManager.error,
          isAnimated: true,
        ),
        barrierDismissible: false,
      );
    }
  }
}
