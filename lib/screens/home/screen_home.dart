import 'package:flutter/material.dart';
import 'package:money_manager_flutter/screens/home/widgets/bottom_navigationbar.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: Text('Home'),
      ),
    );
  }
}
