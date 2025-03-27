import '../utils/assets_manager.dart';

class CategoryModel {
  String title;
  String icon;

  CategoryModel({required this.title, required this.icon});
}

List<CategoryModel> getCategories = [
  CategoryModel(title: 'Вебсайт', icon: ImageManager.web),
  CategoryModel(title: 'Графика', icon: ImageManager.graphic),
  CategoryModel(title: 'Монтирование', icon: ImageManager.video),
  CategoryModel(title: 'Разработка', icon: ImageManager.personalDevelopment),
  CategoryModel(title: 'Математика', icon: ImageManager.math),
];
