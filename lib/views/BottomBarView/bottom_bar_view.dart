import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qazquery/controllers/bottom_bar_controller.dart';

class BottomBarView extends StatelessWidget {
  const BottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());
    return Obx(() => Scaffold(
          body: controller.screens[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (index) => controller.changeIndex(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Басты бет',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Курстар',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.co_present_outlined),
                  label: 'Жеке кабинет',
                ),
              ]),
        ));
  }
}
