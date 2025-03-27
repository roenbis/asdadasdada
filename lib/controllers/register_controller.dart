import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/core/services/auth_services.dart';
import 'package:interactive_cares_lms/models/user_model.dart';
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
      emailError.value = 'Неверный адрес электронной почты';
    }
  }

  void validateConfirmPassword(String confirmPassword) {
    if (confirmPassword != user.password) {
      confirmPasswordError.value = 'Пароли не совпадают';
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
          title: 'Поздравляем',
          description: 'Вы завершили регистрацию!',
          buttonText: 'Звучит хорошо!',
          image: AnimationManager.success,
          isAnimated: true,
          onButtonTap: () => Get.offAllNamed(RouteNames.home),
        ),
        barrierDismissible: false,
      );
    } else {
      Get.dialog(
        const CustomAlert(
          title: 'Ошибка!',
          description: 'Что-то не так при попытке регистрации!',
          buttonText: 'Попробуйте еще раз',
          image: AnimationManager.error,
          isAnimated: true,
        ),
        barrierDismissible: false,
      );
    }
  }
}
