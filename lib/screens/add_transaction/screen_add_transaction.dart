import 'package:flutter/material.dart';
import 'package:money_manager_flutter/db/category/category_db.dart';
import 'package:money_manager_flutter/models/category/category_model.dart';

class ScreenAddTransaction extends StatelessWidget {
  static const routeName = 'add-transaction';
  const ScreenAddTransaction({super.key});

/*
Purpose
Date
Amount
Income/Expense
CategoryType
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //purpose
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Purpose',
            ),
          ),
          //Amount
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Amount',
            ),
          ),
          //Date
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calendar_today),
            label: Text('Select Date'),
          ),
          //income&expense
          Row(
            children: [
              Row(
                children: [
                  Radio(
                      value: CategoryType.income,
                      groupValue: CategoryType.income,
                      onChanged: (newValue) {}),
                  const Text('Income')
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: CategoryType.income,
                      groupValue: CategoryType.income,
                      onChanged: (newValue) {}),
                  const Text('Expense')
                ],
              ),
            ],
          ),
          //categorytypevalue
          DropdownButton(
            hint: const Text('Select Category'),
            items: CategoryDB.instance.incomeListListener.value.map(
              (e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                );
              },
            ).toList(),
            onChanged: (selectedValue) {
              print(selectedValue);
            },
          ),
          //submit
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          )
        ]),
      )),
    );
  }
}
