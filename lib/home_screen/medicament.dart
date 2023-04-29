import 'package:flutter/material.dart';

class ManageMedicamentsPage extends StatelessWidget {
  const ManageMedicamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [ 
            Text(
              'Manage Medicaments',
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
        child: Text('This is the Manage Medicaments page.'),
      ),
    );
  }
}
