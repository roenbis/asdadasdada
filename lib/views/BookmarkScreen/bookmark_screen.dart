import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qazquery/controllers/bookmark_controller.dart';
import 'package:qazquery/global_widgets/custom_app_bar.dart';
import 'package:qazquery/routes/route_names.dart';
import '../../utils/colors.dart';
import '../../utils/themes.dart';
import 'package:qazquery/views/HomeScreen/widgets/leatest_courses_section.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final controller = Get.put(BookmarkController());

  @override
  void initState() {
    super.initState();
    controller.retrieveBookmarks();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: SafeArea(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        children: [
                          LatestCoursesSection(),
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
