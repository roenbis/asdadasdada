import 'package:get/get.dart';
import 'package:qazquery/models/category_model.dart';
import 'package:qazquery/models/course_model.dart';
import 'package:qazquery/models/user_model.dart';

class HomeController extends GetxController {
  final UserModel user = UserModel();
  List<CategoryModel> categories = getCategories;
  List<CourseModel> featuredCourses = getFeaturedCourse;
  RxInt selectedSliderIndex = RxInt(0);

  // Добавлено:
  RxString selectedCategory = 'Жеңіл'.obs;

  final Map<String, List<CourseModel>> categorizedCourses = {
    'Жеңіл': [
      CourseModel(
        promoVide: 'assets/videos/flutter.mp4',
        title: 'Жаңадан бастаушыларға арналған SQL',
        thumbnail:
            'https://bairesdev.mo.cloudinary.net/blog/2023/08/What-Is-JavaScript-Used-For.jpg?tx=w_1920,q_auto',
        salePrice: 2000,
        regularPrice: 1000,
        author: 'QazQuery',
        rating: 5,
        completed: 60,
        completedValue: 0.6,
        topics: [], // ← сюда можешь позже вставить список topic'ов
      ),
    ],
    'Орташа': [
      CourseModel(
        promoVide: 'assets/videos/seo.mp4',
        title: 'Орташа деңгейге арналған PostgreSQL',
        thumbnail:
            'https://www.techmonitor.ai/wp-content/uploads/sites/29/2016/06/SQL.png',
        regularPrice: 12500,
        author: 'QazQuery',
        rating: 4,
        completed: 95,
        completedValue: 0.95,
        topics: [],
      ),
      CourseModel(
        promoVide: 'assets/videos/flutter.mp4',
        title: 'Орташа деңгейге арналған MongoDB',
        thumbnail:
            'https://aiit-sa.co.za/wp-content/uploads/2023/08/Python-Symbol.png',
        regularPrice: 2000,
        salePrice: 1000,
        author: 'QazQuery',
        rating: 3,
        completed: 90,
        completedValue: 0.9,
        topics: [],
      ),
    ],
    'Күрделі': [
      CourseModel(
        promoVide: 'assets/videos/flutter.mp4',
        title: 'Тәжірибелі мамандарға арналған Oracle',
        thumbnail:
            'https://www.sectorlink.com/img/blog/php-web-development.jpg',
        salePrice: 2000,
        regularPrice: 1000,
        author: 'QazQuery',
        rating: 4,
        completed: 90,
        completedValue: 0.9,
        topics: [],
      ),
    ],
  };

  List<CourseModel> get coursesBySelectedCategory =>
      categorizedCourses[selectedCategory.value] ?? [];

  void selectCategory(String title) {
    selectedCategory.value = title;
    update();
  }

  void changeSliderIndex(int index) {
    selectedSliderIndex.value = index;
    update();
  }
}
