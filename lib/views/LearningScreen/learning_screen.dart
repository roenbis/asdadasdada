import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qazquery/global_widgets/in_app_bar.dart';
import 'package:qazquery/views/LearningScreen/widgets/header_section.dart';
import 'package:qazquery/views/LearningScreen/widgets/instructor_section.dart';
import 'package:qazquery/views/LearningScreen/widgets/modules_section.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    return Scaffold(
      appBar: inAppBar('Курс ақпараты'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(arg: arg),
              const InstructorSection(),
              ModulesSection(course: arg)
            ],
          ),
        ),
      ),
    );
  }
}
