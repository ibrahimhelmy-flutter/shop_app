

import 'package:flutter/material.dart';
import 'package:shop_app/presentation/screens/login_screen.dart';
import 'package:shop_app/presentation/screens/on_bording_screen.dart';
import 'package:shop_app/presentation/screens/register_screen.dart';

class AppRouter {
  static Route onGenerateRouting(RouteSettings settings) {
    switch (settings.name) {
      case OnBoardingScreen.id:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RegisterScreen.id:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      default:
        return MaterialPageRoute(builder: (context) =>
            Scaffold(appBar: AppBar(title: Text("UnKnown Route"),),));
    }
  }
}
