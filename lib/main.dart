import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/basics/theme.dart';
import 'package:newsapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // BottomNavController controller = Get.put(BottomNavController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const SplashScreen(), // Set the splash screen as the initial screen
    );
  }

}


