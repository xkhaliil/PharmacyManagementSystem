import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:pharmacymanagementsystem/login_screen/login.dart';
import 'package:pharmacymanagementsystem/splash_screen/splash.dart';


Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName : (context) => const LoginScreen()
};
