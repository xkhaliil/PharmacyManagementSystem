import 'package:flutter/material.dart';
import 'package:pharmacymanagementsystem/routes.dart';
import 'package:pharmacymanagementsystem/screens/splash_screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 200, 200, 200),
        primaryColor: Color.fromARGB(255, 183, 183, 183),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
