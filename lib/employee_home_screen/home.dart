import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/account.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/category.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/medicament.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/myAccount.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/sales.dart';
import 'package:pharmacymanagementsystem/admin_home_screen/stats.dart';

import 'package:pharmacymanagementsystem/screens/login_screen/login.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/Home";

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    print('User is currently signed out!');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              child: Lottie.asset("video/logo.json", height: 70, width: 70),
            ),
            const Text(
              'PharmaSync',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyAccountScreen.routeName);
            },
            icon: const Icon(Icons.account_circle),
          ),
          IconButton(
            onPressed: () {
              signOut();
              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2B32B2), Color(0xFF1488CC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          height: 1000,
          width: 500,
          
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageCategoriesPage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.category, size: 64.0),
                      Text('Manage Categories', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageMedicamentsPage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.medical_services, size: 64.0),
                      Text('Manage Medicaments', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageSalesPage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.shopping_cart, size: 64.0),
                      Text('Manage Sales', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatisticsPage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.bar_chart, size: 64.0),
                      Text('View Stats', style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManageAccountsPage()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.account_circle, size: 64.0),
                        Text('Manage Accounts', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
