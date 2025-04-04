import 'package:qazquery/utils/config.dart';

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
    title: 'Жаңадан бастаушыларға арналған JavaScript',
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
        title: 'Модуль 01: JavaScript-ке кіріспе',
        totalDuration: '00:25:30',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'JavaScript-ке кіріспе',
            lessonUrl: 'assets/videos/flutter.mp4',
            duration: '00:06:53',
            isComplete: false,
          ),
          Lessons(
            title: 'JavaScript орнату және конфигурациялау',
            lessonUrl: 'assets/videos/seo.mp4',
            duration: '00:05:29',
            isComplete: false,
          ),
        ],
      ),
      Topics(
        title: 'Модуль 02: JavaScript Негіздері',
        totalDuration: '00:06:35',
        totalLesson: 1,
        lesson: [
          Lessons(
            title: 'JavaScript Негіздері',
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
    title: 'Жаңадан бастаушыларға арналған SQL',
    thumbnail:
        'https://www.techmonitor.ai/wp-content/uploads/sites/29/2016/06/SQL.png',
    regularPrice: 12500,
    author: AppConfig.appName,
    rating: 4,
    completed: 95,
    completedValue: 0.95,
    topics: [
      Topics(
        title: 'Модуль 01: SQL-ге кіріспе',
        totalDuration: '00:12:09',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'SQL-ге кіріспе',
            lessonUrl: 'assets/videos/seo.mp4',
            duration: '00:05:25',
            isComplete: false,
          ),
          Lessons(
            title: 'SQL орнату және конфигурация',
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
    title: 'Жаңадан бастаушыларға арналған Python',
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
    title: 'Жаңадан бастаушыларға арналған PHP',
    thumbnail: 'https://www.sectorlink.com/img/blog/php-web-development.jpg',
    salePrice: 2000,
    regularPrice: 1000,
    author: AppConfig.appName,
    rating: 4,
    completed: 90,
    completedValue: 0.9,
  ),
];
