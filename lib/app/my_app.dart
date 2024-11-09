import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/bottom_nav_bar.dart';
import '../themes/light_mode.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightMode,
      home: BottomNavBar(),
    );
  }
}
