import 'package:flutter/material.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/presentation/screens/login_screen.dart';
import 'package:shop_app/presentation/screens/on_bording_screen.dart';
import 'package:shop_app/shared/app_route.dart';
import 'package:shop_app/shared/app_theme.dart';
import 'package:shop_app/shared/cashe_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  DioHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'board') ?? false;
  runApp(MyApp(onBoarding: onBoarding));
}

class MyApp extends StatelessWidget {
  bool onBoarding;

  MyApp({required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: OnBoardingScreen(),
      onGenerateRoute: AppRouter.onGenerateRouting,
      initialRoute: onBoarding ? LoginScreen.id : OnBoardingScreen.id,
    );
  }
}
