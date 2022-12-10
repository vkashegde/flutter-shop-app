import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:provydr/screens/cart_screen.dart';
import 'package:provydr/screens/categories_screen.dart';
import 'package:provydr/screens/home_screen.dart';
import 'package:provydr/screens/profile_screen.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context, listen: false);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue[200] : Colors.black87,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: 'Category'),
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 3 ? IconlyBold.buy : IconlyLight.buy),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 2 ? IconlyBold.user2 : IconlyLight.user2),
              label: 'Profile'),
        ],
      ),
    );
  }
}
