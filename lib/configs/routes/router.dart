import 'package:flutter/material.dart';
import 'package:mobile/features/auth/screens/auth_screen.dart';
import 'package:mobile/features/navigation_bar/navigation_bar_app.dart';
import 'package:mobile/features/profile/screens/profile_screen.dart';
import 'package:mobile/features/verification/screens/verification_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    case NavigationBarApp.routeName:
      return MaterialPageRoute(builder: (_) => NavigationBarApp());
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileScreen());
    case VerificationScreen.routeName:
      return MaterialPageRoute(builder: (_) => const VerificationScreen());
    default:
      return MaterialPageRoute(builder: (_) => NavigationBarApp());
    // default:
    //   return MaterialPageRoute(
    //     builder: (_) => const Scaffold(
    //       body: Center(child: Text('Screen does not exist!')),
    //     ),
    //   );
  }
}
