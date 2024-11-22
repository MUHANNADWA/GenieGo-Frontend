import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_store/features/authentication/screens/home/home_screen.dart';
import 'package:new_store/utils/constants/colors.dart';
import 'package:new_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = AppHelperFunctions.isDarkMode;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          indicatorColor: dark
              ? AppColors.white.withOpacity(0.1)
              : AppColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            const NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
            ),
            const NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
            ),
            const NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(
          () => controller.screens.elementAt(controller.selectedIndex.value)),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.deepPurple),
    Container(color: Colors.orange),
  ];
}
