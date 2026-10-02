import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 100), // padding for the floating nav bar
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Hi, John!\nWhat pizza do you want today?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // TODO: Add search bar, promo banner, and categories here
          ],
        ),
      ),
    );
  }
}
