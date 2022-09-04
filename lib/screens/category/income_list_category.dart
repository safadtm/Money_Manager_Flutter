import 'package:flutter/material.dart';

class IncomeListCategory extends StatelessWidget {
  const IncomeListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text('Income $index'),
              trailing: IconButton(
                color: Colors.red,
                hoverColor: Colors.red,
                onPressed: () {},
                icon: Icon(Icons.delete),
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
