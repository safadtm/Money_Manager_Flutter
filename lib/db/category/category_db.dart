import 'package:money_manager_flutter/models/category/category_model.dart';

abstract class CategoryDBfunctions {
  // List<CategoryModel> getCategories();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDBfunctions {
  @override
  Future<void> insertCategory(CategoryModel value) async {}
}
