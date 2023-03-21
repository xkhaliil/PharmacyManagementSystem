import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacymanagementsystem/error_screen/error.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.center,
              child: SizedBox(child: Lottie.asset('video/login.json',
              height: 250,
              width: 250,
              )),
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),

             const Center(
               child: Text(
                'Efficient, user-friendly, and at your service! Welcome to your one-stop solution for pharmacy management.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  
                ),
                         ),
             ),
            const SizedBox(height: 50),

            // Email Text Field

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Password Text Field

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),

            // button sign in

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ErrorScreen.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF11999E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // not a member

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Not a memeber?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  ' Register Now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
