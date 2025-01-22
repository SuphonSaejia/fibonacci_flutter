import 'package:fibonacci_flutter/controller/home_controller.dart';
import 'package:fibonacci_flutter/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci',
      theme: ThemeData(useMaterial3: true),
      home: HomeView(controller: HomeController()),
    );
  }
}
