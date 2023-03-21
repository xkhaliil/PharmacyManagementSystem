import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 25),
            const Text('Hello Again',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            ),
            
            const Text('welcome back you\'ve been missed!',
            style: TextStyle(
              fontSize: 20,
            ),
            ), 
            const SizedBox(height: 50), 

            // Email Text Field

            Padding(
              padding: const EdgeInsets.symmetric (horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child :const Padding(
                  padding: EdgeInsets.only(left:20.0),
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
              padding: const EdgeInsets.symmetric (horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child :const Padding(
                  padding: EdgeInsets.only(left:20.0),
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
              child: Container(
                
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)
                  ),
                child:const Center(
                  child:Text( 'Sign In' ,
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:18, 
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
                const Text('Not a memeber?',
                 style: TextStyle(
                  
                  fontWeight: FontWeight.bold,
                 ),
                ),
                const Text(' Register Now',
                style: TextStyle(
                  color:Colors.blue,
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