import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager_flutter/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CategoryDBfunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDBfunctions {
  ValueNotifier<List<CategoryModel>> incomeListListener = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseListListener = ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.add(value);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    incomeListListener.value.clear();
    expenseListListener.value.clear();
    await Future.forEach(
      _allCategories,
      (CategoryModel category) {
        if (category.categorytype == CategoryType.income) {
          incomeListListener.value.add(category);
        } else {
          expenseListListener.value.add(category);
        }
      },
    );
  }
}
