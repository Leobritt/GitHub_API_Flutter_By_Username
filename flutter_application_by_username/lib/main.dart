import 'package:flutter/material.dart';
import 'package:flutter_application_by_username/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter APi Git',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
