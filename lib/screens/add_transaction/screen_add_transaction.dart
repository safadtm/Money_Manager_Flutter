import 'package:flutter/material.dart';
import 'package:money_manager_flutter/db/category/category_db.dart';
import 'package:money_manager_flutter/db/transaction/transaction_db.dart';
import 'package:money_manager_flutter/models/category/category_model.dart';
import 'package:money_manager_flutter/models/transaction/transaction_model.dart';

class ScreenAddTransaction extends StatefulWidget {
  static const routeName = 'add-transaction';
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;
  String? _categoryID;

  final _purposeTextController = TextEditingController();
  final _amountTextController = TextEditingController();

  @override
  void initState() {
    _selectedCategoryType = CategoryType.income;
    super.initState();
  }

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
            controller: _purposeTextController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Purpose',
            ),
          ),
          //Amount
          TextFormField(
            controller: _amountTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Amount',
            ),
          ),

          //Calender

          TextButton.icon(
            onPressed: () async {
              final _selectedDateTemp = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(
                  const Duration(days: 30),
                ),
                lastDate: DateTime.now(),
              );
              if (_selectedDateTemp == null) {
                return;
              } else {
                print(_selectedDateTemp.toString());
                setState(() {
                  _selectedDate = _selectedDateTemp;
                });
              }
            },
            icon: const Icon(Icons.calendar_today),
            label: Text(_selectedDate == null
                ? 'Select Date'
                : _selectedDate.toString()),
          ),
          //income&expense
          Row(
            children: [
              Row(
                children: [
                  Radio(
                      value: CategoryType.income,
                      groupValue: _selectedCategoryType,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategoryType = CategoryType.income;
                          _categoryID = null;
                        });
                      }),
                  const Text('Income')
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: CategoryType.expense,
                      groupValue: _selectedCategoryType,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategoryType = CategoryType.expense;
                          _categoryID = null;
                        });
                      }),
                  const Text('Expense')
                ],
              ),
            ],
          ),
          //categorytypevalue
          DropdownButton(
            hint: const Text('Select Category'),
            value: _categoryID,
            items: (_selectedCategoryType == CategoryType.income
                    ? CategoryDB().incomeListListener
                    : CategoryDB().expenseListListener)
                .value
                .map(
              (e) {
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                  onTap: () {
                    _selectedCategoryModel = e;
                  },
                );
              },
            ).toList(),
            onChanged: (selectedValue) {
              //   print(selectedValue);
              setState(() {
                _categoryID = selectedValue as String;
              });
            },
          ),
          //submit
          ElevatedButton(
            onPressed: () {},
            child: const Text('Submit'),
          )
        ]),
      )),
    );
  }

  Future<void> submitTransaction() async {
    final _purposeText = _purposeTextController.text;
    final _amountText = _amountTextController.text;
    if (_purposeText.isEmpty) {
      return;
    }
    if (_amountText.isEmpty) {
      return;
    }

    if (_selectedDate == null) {
      return;
    }
    if (_selectedCategoryModel == null) {
      return;
    }
    final _parsedAmount = double.tryParse(_amountText);
    if (_parsedAmount == null) {
      return;
    }
    final _model = TransactionModel(
        purpose: _purposeText,
        amount: _parsedAmount,
        date: _selectedDate!,
        type: _selectedCategoryType!,
        category: _selectedCategoryModel!);
    TransactionDB.instance.addTransaction(_model);
    Navigator.of(context).pop();
  }
}
