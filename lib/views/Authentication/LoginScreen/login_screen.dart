import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/controllers/login_controller.dart';
import 'package:interactive_cares_lms/global_widgets/custom_button.dart';
import 'package:interactive_cares_lms/helpers/form_helpers.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';
import 'package:interactive_cares_lms/utils/assets_manager.dart';
import 'package:interactive_cares_lms/utils/themes.dart';
import '../../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Header Section
                  Column(
                    children: [
                      Image.asset(ImageManager.logo),
                      TextFormat.bold(text: 'С возвращением!'),
                      TextFormat.small(
                        text: 'Войдите, чтобы продолжить',
                        textColor: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  Obx(() => Column(
                        children: [
                          Form(
                            key: controller.globalKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  topLabelText: 'Email',
                                  hintText: 'Введите свой e-mail',
                                  prefixIcon: Icons.alternate_email,
                                  isRequired: true,
                                  errorText:
                                      controller.emailError.value.isNotEmpty
                                          ? 'Неверный адрес электронной почты'
                                          : null,
                                  onChanged: (email) {
                                    controller.user.email = email;
                                    controller.validateEmail(email);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  topLabelText: 'Пароль',
                                  hintText: 'Введите пароль учетной записи',
                                  prefixIcon: Icons.password,
                                  isRequired: true,
                                  isSecured: true,
                                  isLogin: true,
                                  onChanged: (p0) =>
                                      controller.user.password = p0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextFormat.small(
                                text: 'Забыли пароль?',
                                opacity: 0.5,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                            isLoading: controller.isLoading.value,
                            buttonTitle: 'Войти',
                            onTap: () {
                              // if (controller.globalKey.currentState!.validate()) {
                              //   controller.login();
                              // }

                              Get.toNamed(RouteNames.home);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormat.small(
                                text: "Нет аккаунта?",
                                opacity: 0.5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // TextFormat.small(
                              //   text: "Sign Up",
                              //   textColor: AppColors.primary,
                              //   fontWeight: FontWeight.w600,
                              //   onTap: () => Get.toNamed(RouteNames.register),
                              // ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
