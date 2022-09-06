import 'package:flutter/material.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';

class IncomeListCategory extends StatelessWidget {
  const IncomeListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryDB().getCategories();

    return ValueListenableBuilder(
        valueListenable: CategoryDB().incomeListListener,
        builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final category = newList[index];
              return Card(
                child: ListTile(
                  title: Text(category.name),
                  trailing: IconButton(
                    color: Colors.red,
                    hoverColor: Colors.red,
                    onPressed: () {
                      CategoryDB.instance.deleteCategory(category.id);
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: newList.length,
          );
        });
  }
}
