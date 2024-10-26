import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/bottomnavigation_controller.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 50,
            width: againGetCardWidth(context),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.index.value = 0;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        size: 25,
                        Icons.book,
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.index.value = 2;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        color: controller.index.value == 2
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.settings,
                        size: 25,
                        color: controller.index.value == 2
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double againGetCardWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return width / 1.5;
    } else if (width < 1200) {
      return width / 3; // More comfortable for laptops
    } else {
      return width / 4;
    }
  }
}
