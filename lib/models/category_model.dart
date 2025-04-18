import '../utils/assets_manager.dart';

class CategoryModel {
  String title;
  String icon;

  CategoryModel({required this.title, required this.icon});
}

List<CategoryModel> getCategories = [
  CategoryModel(title: 'Жеңіл', icon: ImageManager.web),
  CategoryModel(title: 'Орташа', icon: ImageManager.graphic),
  CategoryModel(title: 'Күрделі', icon: ImageManager.video),
];
