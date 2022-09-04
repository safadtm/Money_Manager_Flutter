import 'package:flutter/material.dart';

class ExpenseListCategory extends StatelessWidget {
  const ExpenseListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text('Expense $index'),
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
        itemCount: 10);
  }
}
