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
        scaffoldBackgroundColor: Color.fromARGB(255, 84, 84, 84),
        primaryColor: Color.fromARGB(255, 60, 60, 60),
      ),
  
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
