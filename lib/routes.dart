import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:pharmacymanagementsystem/error_screen/error.dart';
import 'package:pharmacymanagementsystem/home_screen/home.dart';
import 'package:pharmacymanagementsystem/login_screen/login.dart';

import 'package:pharmacymanagementsystem/splash_screen/splash.dart';


Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName : (context) => const LoginScreen(),
  ErrorScreen.routeName :(context) =>  const ErrorScreen(),
  HomeScreen.routeName :(context) => const HomeScreen(),

};
