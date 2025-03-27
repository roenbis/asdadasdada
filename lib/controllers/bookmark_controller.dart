import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  RxList bookmarks = [].obs;

  void retrieveBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('bookmarks')) {
      bookmarks.value = List<Map<String, dynamic>>.from(
        json.decode(prefs.getString('bookmarks')!),
      );
      update();
      bookmarks.refresh();
    }
  }

  void deleteBookmark(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> updatedBookmarks =
        List<Map<String, dynamic>>.from(
      json.decode(prefs.getString('bookmarks')!),
    );

    updatedBookmarks.removeAt(index);

    prefs.setString('bookmarks', json.encode(updatedBookmarks));

    bookmarks.value = updatedBookmarks;
    update();
    Get.snackbar('Удалено', 'Избранное успешно удалена');
    bookmarks.refresh();
  }
}
