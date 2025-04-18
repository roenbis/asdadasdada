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
  List<PracticeTask>? practiceTasks;

  Lessons({
    required this.title,
    required this.lessonUrl,
    required this.duration,
    required this.isComplete,
    this.practiceTasks,
  });
}

class PracticeTask {
  String question;
  String hint;
  bool isSolved;

  PracticeTask({
    required this.question,
    required this.hint,
    this.isSolved = false,
  });
}

List<CourseModel> getFeaturedCourse = [
  CourseModel(
    promoVide: 'assets/videos/flutter.mp4',
    title: 'Жаңадан бастаушыларға арналған SQL',
    thumbnail:
        'https://www.techmonitor.ai/wp-content/uploads/sites/29/2016/06/SQL.png',
    salePrice: 2000,
    regularPrice: 1000,
    author: AppConfig.appName,
    rating: 5,
    completed: 60,
    completedValue: 0.6,
    topics: [
      Topics(
        title: 'Модуль 01: SQL негіздері',
        totalDuration: '00:20:00',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'SQL деген не?',
            lessonUrl: 'assets/videos/flutter.mp4',
            duration: '00:08:00',
            isComplete: false,
            practiceTasks: [
              PracticeTask(
                  question:
                      'SELECT сұранысын қолданып, барлық деректерді шығарыңыз.',
                  hint: 'SELECT * FROM table_name;'),
            ],
          ),
          Lessons(
            title: 'Таблицалармен жұмыс',
            lessonUrl: 'assets/videos/sql.mp4',
            duration: '00:12:00',
            isComplete: false,
          ),
        ],
      ),
    ],
  ),
  CourseModel(
    promoVide: 'assets/videos/seo.mp4',
    title: 'Орташа деңгейге арналған PostgreSQL',
    thumbnail:
        'https://bairesdev.mo.cloudinary.net/blog/2023/12/What-is-PostgreSQL.jpg?tx=w_1512,q_auto',
    regularPrice: 12500,
    author: AppConfig.appName,
    rating: 4,
    completed: 95,
    completedValue: 0.95,
    topics: [
      Topics(
        title: 'Модуль 01: PostgreSQL-ге шолу',
        totalDuration: '00:12:09',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'PostgreSQL орнату және конфигурациялау',
            lessonUrl: 'assets/videos/seo.mp4',
            duration: '00:05:25',
            isComplete: false,
          ),
          Lessons(
            title: 'Бастапқы сұраныстар',
            lessonUrl: 'assets/videos/flutter.mp4',
            duration: '00:06:43',
            isComplete: false,
          ),
        ],
      ),
      Topics(
        title: 'Модуль 02: Жетілдірілген сұраныстар',
        totalDuration: '00:10:00',
        totalLesson: 1,
        lesson: [
          Lessons(
            title: 'JOIN, GROUP BY, ORDER BY',
            lessonUrl: 'assets/videos/postgres.mp4',
            duration: '00:10:00',
            isComplete: false,
            practiceTasks: [
              PracticeTask(
                  question:
                      'Қосылған екі таблицадан деректерді алу үшін INNER JOIN қолданыңыз.',
                  hint: 'SELECT ... FROM table1 INNER JOIN table2 ...'),
            ],
          ),
        ],
      ),
    ],
  ),
  CourseModel(
    promoVide: 'assets/videos/flutter.mp4',
    title: 'Орташа деңгейге арналған MongoDB',
    thumbnail:
        'https://2024.allthingsopen.org/wp-content/uploads/2024/05/Gold_MongoDB_FG.jpg',
    regularPrice: 2000,
    salePrice: 1000,
    author: AppConfig.appName,
    rating: 3,
    completed: 90,
    completedValue: 0.9,
    topics: [
      Topics(
        title: 'Модуль 01: MongoDB негіздері',
        totalDuration: '00:15:00',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'MongoDB деген не және неге ол NoSQL?',
            lessonUrl: 'assets/videos/flutter.mp4',
            duration: '00:07:00',
            isComplete: false,
          ),
          Lessons(
            title: 'Документтермен жұмыс',
            lessonUrl: 'assets/videos/mongo.mp4',
            duration: '00:08:00',
            isComplete: false,
            practiceTasks: [
              PracticeTask(
                  question:
                      'db.collection.insertOne({...}) арқылы жаңа құжат қосыңыз.',
                  hint: 'Құжат JSON форматында болуы тиіс.'),
            ],
          ),
        ],
      ),
    ],
  ),
  CourseModel(
    promoVide: 'assets/videos/flutter.mp4',
    title: 'Тәжірибелі мамандарға арналған Oracle',
    thumbnail:
        'https://1000logos.net/wp-content/uploads/2017/04/Oracle-Logo-1.png',
    salePrice: 2000,
    regularPrice: 1000,
    author: AppConfig.appName,
    rating: 4,
    completed: 90,
    completedValue: 0.9,
    topics: [
      Topics(
        title: 'Модуль 01: Oracle SQL және PL/SQL',
        totalDuration: '00:18:00',
        totalLesson: 2,
        lesson: [
          Lessons(
            title: 'PL/SQL кіріспе',
            lessonUrl: 'assets/videos/oracle1.mp4',
            duration: '00:08:00',
            isComplete: false,
            practiceTasks: [
              PracticeTask(
                  question: 'PL/SQL блок жазып, шартты оператор қолдан.',
                  hint: 'BEGIN ... IF ... THEN ... END;'),
            ],
          ),
          Lessons(
            title: 'Stored Procedure жасау',
            lessonUrl: 'assets/videos/oracle2.mp4',
            duration: '00:10:00',
            isComplete: false,
          ),
        ],
      ),
      Topics(
        title: 'Модуль 02: Транзакциялар және индекстер',
        totalDuration: '00:10:00',
        totalLesson: 1,
        lesson: [
          Lessons(
            title: 'Транзакция басқару',
            lessonUrl: 'assets/videos/oracle3.mp4',
            duration: '00:10:00',
            isComplete: false,
            practiceTasks: [
              PracticeTask(
                  question: 'COMMIT және ROLLBACK көмегімен деректерді басқар.',
                  hint: 'BEGIN TRANSACTION ... COMMIT немесе ROLLBACK'),
            ],
          ),
        ],
      ),
    ],
  ),
];
