import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/settings_menu_tile.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/user_profile_tile.dart';
import 'package:geniego/features/shop/controllers/settings/settings_controller.dart';
import 'package:geniego/features/shop/screens/address/address.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  AppBar(
                    title: Text(
                      AppTexts.profile,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  // User Profile Card
                  UserProfileTile(),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  //* Account Settings

                  // Account Settings Heading
                  SectionHeading(
                    title: AppTexts.accountSettings,
                    showActionButton: false,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),

                  // My Adresses
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: AppTexts.addresses,
                    subTitle: AppTexts.addressesSub,
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),

                  // My Cart
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: AppTexts.cart,
                    subTitle: AppTexts.cartSub,
                    onTap: () {},
                  ),

                  // My Orders
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: AppTexts.orders,
                    subTitle: AppTexts.ordersSub,
                    onTap: () => Get.toNamed(ordersScreen),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  //* App Settings

                  // App Settings Heading
                  SectionHeading(
                    title: AppTexts.appSettings,
                    showActionButton: false,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),

                  // Change Lang
                  SettingsMenuTile(
                    icon: Iconsax.language_square,
                    title: AppTexts.language,
                    subTitle: AppTexts.languageSub,
                    trailing: DropdownButton<String>(
                      value: controller.languages.value,
                      items: [
                        DropdownMenuItem(
                          value: 'System',
                          child: Text('System'),
                        ),
                        DropdownMenuItem(
                          value: 'En',
                          child: Text('En'),
                        ),
                        DropdownMenuItem(
                          value: 'Ar',
                          child: Text('Ar'),
                        ),
                      ],
                      onChanged: (Object? value) =>
                          controller.chnageLang(value),
                    ),
                  ),

                  // Change Theme
                  SettingsMenuTile(
                    icon: Iconsax.colors_square,
                    title: AppTexts.theme,
                    subTitle: AppTexts.themeSub,
                    trailing: DropdownButton<String>(
                      value: controller.themes.value,
                      items: [
                        DropdownMenuItem(
                          value: 'System',
                          child: Text('System'),
                        ),
                        DropdownMenuItem(
                          value: 'Light',
                          child: Text('Light'),
                        ),
                        DropdownMenuItem(
                          value: 'Dark',
                          child: Text('Dark'),
                        ),
                      ],
                      onChanged: (Object? value) =>
                          controller.chnageTheme(value),
                    ),
                  ),

                  // Geolocation
                  Obx(
                    () => SettingsMenuTile(
                      icon: Iconsax.location,
                      title: AppTexts.geolocation,
                      subTitle: AppTexts.geolocationSub,
                      trailing: Switch(
                        value: controller.geoLocation.value,
                        onChanged: (value) => controller.geoLocation.toggle(),
                      ),
                    ),
                  ),

                  // Notifications
                  Obx(
                    () => SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: AppTexts.notifications,
                      subTitle: AppTexts.notificationsSub,
                      trailing: Switch(
                        value: controller.notification.value,
                        onChanged: (value) => controller.notification.toggle(),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
