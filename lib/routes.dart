
import 'package:flutter/cupertino.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/myAccount.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/stats.dart';
import 'package:pharmacymanagementsystem/crud_screen/add/add_account.dart';
import 'package:pharmacymanagementsystem/crud_screen/remove/remove_account.dart';
import 'package:pharmacymanagementsystem/crud_screen/update/update_account.dart';
import 'package:pharmacymanagementsystem/screens/error_screen/error.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/home.dart';
import 'package:pharmacymanagementsystem/salesemployee_screen/emplyeHome.dart';
import 'package:pharmacymanagementsystem/screens/login_screen/login.dart';

import 'package:pharmacymanagementsystem/screens/splash_screen/splash.dart';

import 'admin_home_screen/account.dart';
import 'admin_home_screen/category.dart';
import 'admin_home_screen/medicament.dart';
import 'admin_home_screen/sales.dart';


Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName : (context) => const LoginScreen(),
  ErrorScreen.routeName :(context) =>  const ErrorScreen(),
  HomeScreen.routeName :(context) => const HomeScreen(),
  EmployeeHomeScreen.routeName :(context) => const EmployeeHomeScreen(),
  StatisticsScreen.routeName:(context) => const StatisticsScreen(),
  MyAccountScreen.routeName :(context) => const MyAccountScreen(),
  AddAccountScreen.routeName :(context) => const AddAccountScreen(),
  AccountUpdateScreen.routeName :(context) => const AccountUpdateScreen(),
  AccountRemoveScreen.routeName :(context) => const AccountRemoveScreen(),
  ManageAccountsScreen.routeName :(context) => const ManageAccountsScreen(),
  ManageCategoriesScreen.routeName :(context) => const ManageCategoriesScreen(),
  ManageMedicamentsScreen.routeName :(context) => const ManageMedicamentsScreen(),
  ManageSalesScreen.routeName :(context) => const ManageSalesScreen(),
};
