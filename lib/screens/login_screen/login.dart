import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/home.dart';
import 'package:pharmacymanagementsystem/salesemployee_screen/emplyeHome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routeName = "/Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await signInAutomatically();
      //await signIn();
      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      Lottie.asset("");
      showErrorMessage();
    }
  }

  Future<void> signInAutomatically() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "ltaief.khalil@gmail.com",
      password: "admin111",
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
      if (FirebaseAuth.instance.currentUser?.email ==
          "ltaief.khalil@gmail.com") {
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (routes)=> false);
      }
    });
  }

  Future<void> signIn() async {
    if (emailController.text == "ltaief.khalil@gmail.com") {
      // _loginAsAdmin = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
        if (FirebaseAuth.instance.currentUser?.email ==
            "ltaief.khalil@gmail.com") {
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (routes)=> false);
        }
      });
    } else {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, EmployeeHomeScreen.routeName, (routes)=> false);
      });
    }
  }

  // error message to user
  void showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        // ignore: prefer_const_constructors
        return AlertDialog(
          backgroundColor: const Color(0xFF393E46),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text("Impossible de se connecter"),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFA5C9CA),
                  Color(0xFFE7F6F2),
                ],
              ),
            ),
            child: SizedBox(
              height: 700,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'video/login.json',
                    controller: _controller,
                    height: 250,
                    width: 250,
                    repeat: false,
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Efficient, user-friendly, and at your service! Welcome to your one-stop solution for pharmacy management.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Color(0xFF2C3333)),
                        filled: true,
                        fillColor: Color(0xFFE7F6F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFF2C3333)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outlined,
                            color: Color(0xFF2C3333)),
                        filled: true,
                        fillColor: Color(0xFFE7F6F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFF2C3333),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: signUserIn,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF434242)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
