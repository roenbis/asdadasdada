import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qazquery/controllers/register_controller.dart';
import 'package:qazquery/global_widgets/custom_button.dart';
import 'package:qazquery/helpers/form_helpers.dart';
import 'package:qazquery/routes/route_names.dart';
import 'package:qazquery/utils/themes.dart';
import '../../../utils/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
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
                      TextFormat.bold(text: 'Қазір Тіркеліңіз!'),
                      TextFormat.small(
                        text: 'Төмендегі мәліметтерді толтырыңыз',
                        textColor: Colors.black.withOpacity(.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  Obx(() => Column(
                        children: [
                          // Login Form
                          Form(
                            key: controller.globalKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  topLabelText: 'Толық Аты-Жөні',
                                  hintText: 'Толық аты-жөніңізді енгізіңіз',
                                  prefixIcon: Icons.person_rounded,
                                  isRequired: true,
                                  onChanged: (p0) =>
                                      controller.user.fullName = p0,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  topLabelText: 'Пайдаланушы аты',
                                  hintText: 'Пайдаланушы атыңызды енгізіңіз',
                                  prefixIcon: Icons.alternate_email,
                                  isRequired: true,
                                  onChanged: (p0) =>
                                      controller.user.username = p0,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  topLabelText: 'Сіздің Электрондық Поштаңыз',
                                  hintText: 'Электрондық поштаңызды енгізіңіз',
                                  prefixIcon: Icons.email_rounded,
                                  isRequired: true,
                                  onChanged: (username) {
                                    controller.user.email = username;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  topLabelText: 'Пароль',
                                  hintText:
                                      'Есептік жазбаның паролін енгізіңіз',
                                  prefixIcon: Icons.password,
                                  isRequired: true,
                                  isSecured: true,
                                  onChanged: (p0) =>
                                      controller.user.password = p0,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  topLabelText: 'Құпия Сөзді Растау',
                                  hintText: 'Құпия сөзді қайта теріңіз',
                                  prefixIcon: Icons.password,
                                  isRequired: true,
                                  isSecured: true,
                                  errorText: controller
                                          .confirmPasswordError.value.isNotEmpty
                                      ? 'Құпия сөз сәйкес келмеді'
                                      : null,
                                  onChanged: (p0) {
                                    controller.validateConfirmPassword(p0);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          // Login Button
                          CustomButton(
                            isLoading: controller.isLoading.value,
                            buttonTitle: 'Тіркелу',
                            onTap: () {
                              // Check the form is valid or not
                              if (controller.globalKey.currentState!
                                  .validate()) {
                                if (controller.emailError.value.isEmpty &&
                                    controller
                                        .confirmPasswordError.value.isEmpty) {
                                  controller.register();
                                }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          // Create Account Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormat.small(
                                text: "Есептік жазбаңыз бар ма?",
                                opacity: 0.5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextFormat.small(
                                text: "Кіру",
                                textColor: AppColors.primary,
                                fontWeight: FontWeight.w600,
                                onTap: () => Get.toNamed(RouteNames.login),
                              ),
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
