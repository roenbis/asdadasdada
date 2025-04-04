import 'package:get/get.dart';
import 'package:qazquery/controllers/bottom_bar_controller.dart';
import 'package:qazquery/controllers/course_controller.dart';
import 'package:qazquery/controllers/home_controller.dart';
import 'package:qazquery/controllers/login_controller.dart';
import 'package:qazquery/controllers/register_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => CourseController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  }
}
