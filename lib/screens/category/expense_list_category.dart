import 'package:flutter/material.dart';
import 'package:money_manager_flutter/db/category/category_db.dart';

import '../../models/category/category_model.dart';

class ExpenseListCategory extends StatelessWidget {
  const ExpenseListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().expenseListListener,
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
                    onPressed: () {},
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
