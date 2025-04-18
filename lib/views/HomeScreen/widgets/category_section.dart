import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qazquery/controllers/home_controller.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          'Категория',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black.withOpacity(.6),
          ),
        ),
        SizedBox(
          height: 120,
          child: GetBuilder<HomeController>(
            builder: (_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  final isSelected =
                      category.title == controller.selectedCategory.value;

                  return GestureDetector(
                    onTap: () {
                      controller.selectCategory(category.title);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue.shade100
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.black.withOpacity(.1),
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(category.icon),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 65,
                          child: Text(
                            category.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Obx(() {
          final courses = controller.coursesBySelectedCategory;

          return Column(
            children: courses.map((course) {
              return ListTile(
                leading: Image.network(course.thumbnail, width: 50, height: 50),
                title: Text(course.title),
                subtitle: Text('Автор: ${course.author}'),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
