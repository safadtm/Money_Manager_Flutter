enum CategoryType {
  income,
  expense,
}

class CategoryModel {
  final String id;
  final String name;
  final CategoryType;
  final bool isDeleted;

  CategoryModel({
    required this.id,
    required this.name,
    required this.CategoryType,
    this.isDeleted = false,
  });
}
