import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/routes.dart';
import 'package:pharmacymanagementsystem/splash_screen/splash.dart';

void main() async {
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
        theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFE4F9F5),
        primaryColor: Color(0xFFE4F9F5),
      ),
  
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
