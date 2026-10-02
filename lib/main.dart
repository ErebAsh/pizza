import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KPizzaApp());
}

class KPizzaApp extends StatelessWidget {
  const KPizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K Pizza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
          secondary: Colors.redAccent,
        ),
        useMaterial3: true,
        fontFamily: 'Inter', // Assuming we will use a modern font
      ),
      home: const MainScreen(),
    );
  }
}
