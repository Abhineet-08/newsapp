import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/components/bottomnavigation_bar.dart';
import 'package:newsapp/controller/bottomnavigation_controller.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: const BottomNavigation(),
      body: Obx(() => controller.screens[controller.index.value]),
    );
  }
}
