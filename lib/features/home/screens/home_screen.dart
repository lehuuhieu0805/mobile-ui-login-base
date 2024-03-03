import 'package:flutter/material.dart';
import 'package:mobile/constants/routes.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = RoutePath.home;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trang chủ',
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Text('Trang chủ'),
    );
  }
}
