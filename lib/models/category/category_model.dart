enum CategoryType {
  income,
  expense,
}

class CategoryModel {
  final String name;
  final bool isDeleted;
  final CategoryType;

  CategoryModel({
    required this.name,
    required this.CategoryType,
    this.isDeleted = false,
  });
}
