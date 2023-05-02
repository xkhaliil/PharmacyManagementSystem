import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/myAccount.dart';
import 'package:pharmacymanagementsystem/crud_screen/add/add_account.dart';
import 'package:pharmacymanagementsystem/crud_screen/remove/remove_account.dart';
import 'package:pharmacymanagementsystem/crud_screen/update/update_account.dart';
import 'package:pharmacymanagementsystem/screens/error_screen/error.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/home.dart';
import 'package:pharmacymanagementsystem/salesemployee_screen/emplyeHome.dart';
import 'package:pharmacymanagementsystem/screens/login_screen/login.dart';

import 'package:pharmacymanagementsystem/screens/splash_screen/splash.dart';


Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName : (context) => const LoginScreen(),
  ErrorScreen.routeName :(context) =>  const ErrorScreen(),
  HomeScreen.routeName :(context) => const HomeScreen(),
  EmployeeHomeScreen.routeName :(context) => const EmployeeHomeScreen(),
  MyAccountScreen.routeName :(context) => const MyAccountScreen(),
  AddAccountScreen.routeName :(context) => const AddAccountScreen(),
  AccountUpdateScreen.routeName :(context) => const AccountUpdateScreen(),
  AccountRemoveScreen.routeName :(context) => const AccountRemoveScreen(),
  

  
};
