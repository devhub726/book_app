import 'package:flutter/material.dart';
import '../features/dashboard/presentation/pages/dashboard.dart';
import '../themes/light_mode.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home:  Dashboard(),
    );
  }
}
