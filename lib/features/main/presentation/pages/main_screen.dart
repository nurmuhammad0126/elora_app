import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:eloro_app_for_home_work/features/cart/presentation/page/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Container(color: Colors.amber),
    CartScreen(),
    Container(color: Colors.red),
    Container(color: Colors.blueGrey),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        switchInCurve: Curves.bounceIn,
        switchOutCurve: Curves.bounceInOut,
        child: _pages[_selectedIndex],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: context.colors.grey200,
            unselectedItemColor: context.colors.grey400,

            selectedLabelStyle: context.styles.s14w500,
            showUnselectedLabels: true,
            selectedItemColor: context.colors.textPrimary.withAlpha(200),
          ),
          splashColor: context.colors.primary.withAlpha(60),
          highlightColor: Colors.transparent,
          // splashFactory: InkRipple.splashFactory,
        ),

        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: context.colors.textPrimary.withAlpha(200),
            size: 30.o,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Bosh sahifa',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Qidiruv'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Savatcha',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'Buyurtmalar',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
