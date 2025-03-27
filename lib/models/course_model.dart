import 'package:interactive_cares_lms/utils/config.dart';

class CourseModel {
  String title;
  String thumbnail;
  int? salePrice;
  int regularPrice;
  String author;
  int? rating;
  int? completed;
  double? completedValue;
  List<Topics>? topics;
  String promoVide;

  CourseModel({
    required this.title,
    required this.thumbnail,
    this.salePrice,
    required this.regularPrice,
    required this.author,
    this.rating,
    this.completed,
    this.completedValue,
    this.topics,
    required this.promoVide,
  });
}

class Topics {
  String title;
  String totalDuration;
  int totalLesson;
  List<Lessons>? lesson;

  Topics({
    required this.title,
    required this.totalDuration,
    required this.totalLesson,
    this.lesson,
  });
}

class Lessons {
  String title;
  String lessonUrl;
  String duration;
  bool isComplete;

  Lessons({
    required this.title,
    required this.lessonUrl,
    required this.duration,
    required this.isComplete,
  });
}

List<CourseModel> getFeaturedCourse = [
  CourseModel(
    promoVide: 'assets/videos/flutter.mp4',
    title: 'JavaScript для начинающих',
    thumbnail:
        'https://bairesdev.mo.cloudinary.net/blog/2023/08/What-Is-JavaScript-Used-For.jpg?tx=w_1920,q_auto',
    salePrice: 2000,
    regularPrice: 1000,
    author: AppConfig.appName,
    rating: 5,
    completed: 60,
    completedValue: 0.6,
    topics: [
      Topics(
        title: 'Модуль 01: Введение в JavaScript',
        totalDuration: '00:25:30',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'Введение в JavaScript',
            lessonUrl: 'assets/videos/flutter.mp4',
            duration: '00:06:53',
            isComplete: false,
          ),
          Lessons(
            title: 'Установка и конфигурация JavaScript',
            lessonUrl: 'assets/videos/seo.mp4',
            duration: '00:05:29',
            isComplete: false,
          ),
        ],
      ),
      Topics(
        title: 'Модуль 02: Основы JavaScript',
        totalDuration: '00:06:35',
        totalLesson: 1,
        lesson: [
          Lessons(
            title: 'Основы JavaScript',
            lessonUrl: 'assets/videos/flutter.mp4',
            duration: '00:06:35',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  CourseModel(
    promoVide: 'assets/videos/seo.mp4',
    title: 'SQL для начинающих',
    thumbnail:
        'https://www.techmonitor.ai/wp-content/uploads/sites/29/2016/06/SQL.png',
    regularPrice: 12500,
    author: AppConfig.appName,
    rating: 4,
    completed: 95,
    completedValue: 0.95,
    topics: [
      Topics(
        title: 'Модуль 01: Введение в SQL',
        totalDuration: '00:12:09',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'Введение в SQL',
            lessonUrl: 'assets/videos/seo.mp4',
            duration: '00:05:25',
            isComplete: false,
          ),
          Lessons(
            title: 'Установка и конфигурация SQL',
            lessonUrl: 'assets/videos/flutter.mp4',
            duration: '00:06:43',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  CourseModel(
    promoVide: 'assets/videos/flutter.mp4',
    title: 'Python для начинающих',
    thumbnail:
        'https://aiit-sa.co.za/wp-content/uploads/2023/08/Python-Symbol.png',
    regularPrice: 2000,
    salePrice: 1000,
    author: AppConfig.appName,
    rating: 1,
    completed: 90,
    completedValue: 0.9,
  ),
  CourseModel(
    promoVide: 'assets/videos/flutter.mp4',
    title: 'PHP для начинающих',
    thumbnail: 'https://www.sectorlink.com/img/blog/php-web-development.jpg',
    salePrice: 2000,
    regularPrice: 1000,
    author: AppConfig.appName,
    rating: 4,
    completed: 90,
    completedValue: 0.9,
  ),
];
