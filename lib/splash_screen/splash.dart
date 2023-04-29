import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacymanagementsystem/error_screen/error.dart';
import 'package:pharmacymanagementsystem/home_screen/home.dart';
import 'package:pharmacymanagementsystem/login_screen/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName="/";

  @override
    Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2200), () {
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
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