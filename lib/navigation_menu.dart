import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/screens/settings/settings.dart';
import 'package:geniego/features/shop/screens/wishlist/wishlist.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/features/shop/screens/home/home_screen.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: AppHelper.screenWidth <= 800
          ? Obx(
              () => NavigationBar(
                height: 80,
                elevation: 0,
                indicatorColor: AppHelper.isDarkMode
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
            )
          : null,
      body: Row(
        children: [
          // Side Bar
          Container(
            width: 300,
            color: AppHelper.isDarkMode
                ? AppColors.black.withOpacity(0.9)
                : AppColors.white,
            // child: ListView(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   children: const [
            //     ListTile(
            //       leading: Icon(Iconsax.home),
            //       title: Text('Home'),
            //     ),
            //     ListTile(
            //       leading: Icon(Iconsax.shop),
            //       title: Text('Store'),
            //     ),
            //     ListTile(
            //       leading: Icon(Iconsax.heart),
            //       title: Text('Wishlist'),
            //     ),
            //     ListTile(
            //       leading: Icon(Iconsax.user),
            //       title: Text('Profile'),
            //     ),
            //   ],
            // ),
            child: Obx(
              () => NavigationBar(
                elevation: 0,
                indicatorColor: AppHelper.isDarkMode
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
          ),

          // Main Content
          Expanded(
            child: Obx(() =>
                controller.screens.elementAt(controller.selectedIndex.value)),
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.deepPurple),
    const FavouriteScreen(),
  ];
}
