import 'package:flutter/material.dart';
import 'package:money_manager_flutter/screens/category/screen_categories.dart';
import 'package:money_manager_flutter/screens/home/widgets/bottom_navigationbar.dart';
import 'package:money_manager_flutter/screens/transactions/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransactions(),
    ScreenCategories(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext ctx, int updatedIndex, Widget? _) {
              return _pages[updatedIndex];
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print(
              Text('add transactions'),
            );
          } else {
            print(
              Text('add categories'),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
