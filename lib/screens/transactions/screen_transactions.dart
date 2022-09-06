import 'package:flutter/material.dart';
import 'package:money_manager_flutter/db/transaction/transaction_db.dart';
import 'package:money_manager_flutter/models/category/category_model.dart';
import 'package:money_manager_flutter/models/transaction/transaction_model.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();

    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) {
                final _value = newList[index];
                return Card(
                  elevation: 0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _value.type == CategoryType.income
                          ? Colors.green
                          : Colors.red,
                      child: Text(
                        parseDate(_value.date),
                      ),
                      radius: 50,
                    ),
                    title: Text('Rs ${_value.amount} '),
                    subtitle: Text(_value.category.name),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: newList.length);
        });
  }

  String parseDate(DateTime date) {
    return '${date.day}\n${date.month}';
  }
}
