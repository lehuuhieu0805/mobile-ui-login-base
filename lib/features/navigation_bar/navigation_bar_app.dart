import 'package:flutter/material.dart';
import 'package:mobile/constants/app_color.dart';
import 'package:mobile/constants/routes.dart';
import 'package:mobile/features/home/screens/home_screen.dart';
import 'package:mobile/features/profile/screens/profile_screen.dart';

class NavigationBarApp extends StatefulWidget {
  static const String routeName = RoutePath.navigationBar;

  int? pageIndex;
  NavigationBarApp({super.key, this.pageIndex});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _currentPageIndex = 0;

  void _onItemTapped(int index) {
    widget.pageIndex = null;
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageIndex != null) {
      setState(() {
        _currentPageIndex = widget.pageIndex!;
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: AppColor.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _currentPageIndex,
        onTap: _onItemTapped,
      ),
      body: [
        const HomeScreen(),
        const ProfileScreen(),
      ][_currentPageIndex],
    );
  }
}
