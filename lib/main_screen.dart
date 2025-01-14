import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/user_profile_tile.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/features/shop/controllers/cart/cart_controller.dart';
import 'package:geniego/features/owner/screens/dashboard/dashboard_screen.dart';
import 'package:geniego/features/shop/screens/settings/settings_screen.dart';
import 'package:geniego/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:geniego/features/shop/screens/store/stores_screen.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/features/shop/screens/home/home_screen.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    CartController.instance.initCart();
    log('current user = ${AuthService.currentUser}');

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
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Iconsax.home),
                    selectedIcon:
                        Icon(Iconsax.home_15, color: AppColors.darkLightInvert),
                    label: AppTexts.home,
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.shop),
                    selectedIcon:
                        Icon(Iconsax.shop5, color: AppColors.darkLightInvert),
                    label: AppTexts.stores,
                  ),
                  AuthService.currentUser.role == 'Owner'
                      ? NavigationDestination(
                          icon: Icon(Iconsax.activity),
                          selectedIcon: Icon(Iconsax.activity5,
                              color: AppColors.darkLightInvert),
                          label: AppTexts.dashboard,
                        )
                      : NavigationDestination(
                          icon: Icon(Iconsax.heart),
                          selectedIcon: Icon(Iconsax.heart5,
                              color: AppColors.darkLightInvert),
                          label: AppTexts.wishlist,
                        ),
                  NavigationDestination(
                    icon: Icon(Iconsax.setting_2),
                    selectedIcon: Icon(Iconsax.setting_21,
                        color: AppColors.darkLightInvert),
                    label: AppTexts.settings,
                  ),
                ],
              ),
            )
          : null,
      body: Row(
        children: [
          // Side Bar
          AppHelper.screenWidth > 800
              ? Obx(
                  () => NavigationRail(
                    leading: Column(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                            width: 250,
                            child:
                                const UserProfileTile(showEditButton: false)),
                        const Divider(color: Colors.grey),
                      ],
                    ),
                    extended: true,
                    indicatorColor: AppHelper.isDarkMode
                        ? AppColors.white.withOpacity(0.1)
                        : AppColors.black.withOpacity(0.1),
                    selectedIndex: controller.selectedIndex.value,
                    onDestinationSelected: (index) =>
                        controller.selectedIndex.value = index,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Iconsax.home),
                        label: Text(AppTexts.home),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Iconsax.shop),
                        label: Text(AppTexts.stores),
                      ),
                      AuthService.currentUser.role == 'Owner'
                          ? NavigationRailDestination(
                              icon: Icon(Iconsax.activity),
                              label: Text(AppTexts.dashboard),
                            )
                          : NavigationRailDestination(
                              icon: Icon(Iconsax.heart),
                              label: Text(AppTexts.wishlist),
                            ),
                      NavigationRailDestination(
                        icon: Icon(Iconsax.user),
                        label: Text(AppTexts.settings),
                      ),
                    ],
                  ),
                )
              : SizedBox(),

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
    const StoreScreen(),
    AuthService.currentUser.role == 'Owner'
        ? const OwnerDashboardScreen()
        : const WishlistScreen(),
    const SettingsScreen(),
  ];
}
