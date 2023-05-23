import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacymanagementsystem/data/account/account-source.dart';
import '../../admin_home_screen/home.dart';
import '../../salesemployee_screen/emplyeHome.dart';
import '../login_screen/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2200), () {
      var currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
       String userUID = FirebaseAuth.instance.currentUser!.uid; 
      AccountSource.getAllAccounts().then((value) {
        for (int i = 0; i < value.length; i++) {
          print(value[i].role);
          if (value[i].uid == userUID) {
            
            if (value[i].role.toString() == "Role.admin") {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (routes) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, EmployeeHomeScreen.routeName, (routes) => false);
            }
          }
        }
      });
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          (route) => false,
        );
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Lottie.asset(
                        "video/splash2.json",
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
