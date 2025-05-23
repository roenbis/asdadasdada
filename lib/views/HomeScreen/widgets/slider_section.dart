import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:get/get.dart';
import 'package:qazquery/controllers/home_controller.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../utils/colors.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final size = MediaQuery.sizeOf(context);
    List<String> sliderImages = [
      'https://static.tildacdn.one/tild6262-6661-4034-b164-383063636462/What_is_SQL_Database.png',
      'https://static.tildacdn.one/tild6262-6661-4034-b164-383063636462/What_is_SQL_Database.png',
      'https://static.tildacdn.one/tild6262-6661-4034-b164-383063636462/What_is_SQL_Database.png',
      'https://static.tildacdn.one/tild6262-6661-4034-b164-383063636462/What_is_SQL_Database.png',
    ];
    return Container(
      width: size.width * .90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 15,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            children: [
              CarouselSlider.builder(
                  itemCount: sliderImages.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: size.width * .90,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            sliderImages[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 100,
                    enlargeCenterPage: true,
                    enlargeFactor: .3,
                    onPageChanged: (index, reason) =>
                        controller.changeSliderIndex(index),
                  )),
              const SizedBox(
                height: 10,
              ),
              PageViewDotIndicator(
                currentItem: controller.selectedSliderIndex.value,
                count: sliderImages.length,
                unselectedColor: AppColors.primary.withOpacity(.2),
                selectedColor: AppColors.primary,
                size: const Size(10, 10),
                margin: const EdgeInsets.only(right: 1, left: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
