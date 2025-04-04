import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qazquery/global_widgets/custom_button.dart';
import 'package:qazquery/routes/route_names.dart';
import 'package:qazquery/utils/assets_manager.dart';
import 'package:qazquery/utils/themes.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageManager.getStarted),
              Column(
                children: [
                  TextFormat.bold(
                    text: 'Өзіңіздің\n оқу жоспарыңызды жасаңыз',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormat.small(
                    text:
                        'Оқу жоспарымен айналысыңыз, \nоқуға деген ынтаны арттырыңыз.',
                    opacity: 0.5,
                  ),
                ],
              ),
              Row(
                children: [
                  // Expanded(
                  //   child: CustomButton(
                  //     buttonTitle: 'Sign up',
                  //     onTap: () => Get.toNamed(RouteNames.register),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  Expanded(
                    child: CustomButton(
                      buttonTitle: 'Кіру',
                      isBorder: true,
                      onTap: () => Get.toNamed(RouteNames.login),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
