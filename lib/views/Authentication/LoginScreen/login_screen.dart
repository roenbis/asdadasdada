import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qazquery/controllers/login_controller.dart';
import 'package:qazquery/global_widgets/custom_button.dart';
import 'package:qazquery/helpers/form_helpers.dart';
import 'package:qazquery/routes/route_names.dart';
import 'package:qazquery/utils/assets_manager.dart';
import 'package:qazquery/utils/themes.dart';
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
                      Image.asset(
                        ImageManager.logo,
                        height: 200,
                      ),
                      TextFormat.bold(text: 'Оралуыңызбен!'),
                      TextFormat.small(
                        text: 'Жалғастыру үшін жүйеге кіріңіз',
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
                                  hintText: 'Электрондық поштаңызды енгізіңіз',
                                  prefixIcon: Icons.alternate_email,
                                  isRequired: true,
                                  errorText: controller
                                          .emailError.value.isNotEmpty
                                      ? 'Электрондық пошта мекенжайы дұрыс емес'
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
                                  topLabelText: 'Құпия сөз',
                                  hintText: 'Тіркелгі құпия сөзін енгізіңіз',
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
                                text: 'Құпия сөзді ұмыттыңыз ба?',
                                opacity: 0.5,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                            isLoading: controller.isLoading.value,
                            buttonTitle: 'Кіру',
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
                                text: "Тіркелгіңіз жоқпа?",
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
