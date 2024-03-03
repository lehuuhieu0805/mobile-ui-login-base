import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/configs/routes/router.dart';
import 'package:mobile/constants/routes.dart';
import 'package:mobile/utils/app_theme.dart';
import 'package:mobile/utils/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();

  // initial SharedPreferences instance
  await SharedPreferencesUtils.init();

  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      initialRoute: SharedPreferencesUtils.getAccessToken() != null
          ? RoutePath.navigationBar
          : RoutePath.auth,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: ((settings) => generateRoute(settings)),
    );
  }
}
