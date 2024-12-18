import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/user_profile_tile.dart';
import 'package:geniego/features/authentication/screens/settings/settings.dart';
import 'package:geniego/features/shop/screens/wishlist/wishlist.dart';
import 'package:geniego/features/shop/screens/store/store_screen.dart';
import 'package:geniego/utils/constants/text_strings.dart';
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
                  NavigationDestination(
                    icon: Icon(Iconsax.home),
                    label: AppTexts.home,
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.shop),
                    label: AppTexts.shop,
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.heart),
                    label: AppTexts.wishlist,
                  ),
                  NavigationDestination(
                    icon: Icon(Iconsax.user),
                    label: AppTexts.profile,
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
                        label: Text(AppTexts.shop),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Iconsax.heart),
                        label: Text(AppTexts.wishlist),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Iconsax.user),
                        label: Text(AppTexts.profile),
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
  Rx<int> selectedIndex = 3.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
