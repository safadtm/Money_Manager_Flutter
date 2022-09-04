import 'package:flutter/material.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) {
          return const Card(
            elevation: 0,
            child: ListTile(
              leading: CircleAvatar(
                child: Text('12\nAug'),
                radius: 50,
              ),
              title: Text('Rs 10,0000'),
              subtitle: Text('salary'),
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
