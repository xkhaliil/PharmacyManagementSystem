import 'package:flutter/material.dart';

class ViewStatsPage extends StatelessWidget {
  const ViewStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [ 
            Text(
              'Manage Stats',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
  
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
      body: const Center(
        child: Text('This is the View Stats page.'),
      ),
    );
  }
}