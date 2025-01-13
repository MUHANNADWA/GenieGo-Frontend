import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/common/widgets/products/cart/cart_badge.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/settings_menu_tile.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/user_profile_tile.dart';
import 'package:geniego/features/shop/controllers/settings/profile_controller.dart';
import 'package:geniego/features/shop/controllers/settings/settings_controller.dart';
import 'package:geniego/features/shop/screens/address/addresses_screen.dart';
import 'package:geniego/features/shop/screens/cart/cart_screen.dart';
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
    final profileController = Get.put(ProfileController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  AppAppBar(
                    title: Text(
                      AppTexts.settings,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // User Profile Card
                  UserProfileTile(),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings Heading
                  SectionHeading(title: AppTexts.accountSettings),

                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // My Adresses
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: AppTexts.addresses,
                    subTitle: AppTexts.addressesSub,
                    onTap: () => Get.to(() => const AddressScreen()),
                  ),

                  // My Cart
                  SettingsMenuTile(
                    leadingWidget: CartBadge(
                      alignment: Alignment(1, -1),
                      child: Icon(
                        Iconsax.shopping_cart,
                        size: 28,
                        color: AppColors.primary,
                      ),
                    ),
                    title: AppTexts.cart,
                    subTitle: AppTexts.cartSub,
                    onTap: () => Get.to(() => const CartScreen()),
                  ),

                  // My Orders
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: AppTexts.orders,
                    subTitle: AppTexts.ordersSub,
                    onTap: () => Get.toNamed(ordersScreen),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // App Settings Heading
                  SectionHeading(title: AppTexts.appSettings),

                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // Change Lang
                  SettingsMenuTile(
                    icon: Iconsax.language_square,
                    title: AppTexts.language,
                    subTitle: AppTexts.languageSub,
                    onTap: () => Get.bottomSheet(BottomSheet(
                      onClosing: () {},
                      builder: (_) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                              title:
                                  SectionHeading(title: AppTexts.changeLang)),
                          Divider(),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.languages.length,
                            itemBuilder: (_, index) => ListTile(
                              title: Text(controller.languages[index]),
                              trailing: Obx(() => controller.languages[index] ==
                                      controller.language.value
                                  ? Icon(Iconsax.tick_circle,
                                      color: AppColors.primary)
                                  : SizedBox()),
                              onTap: () => controller
                                  .chnageLang(controller.languages[index]),
                            ),
                          ),
                        ],
                      ),
                      enableDrag: false,
                    )),
                  ),

                  // Change Theme
                  SettingsMenuTile(
                    icon: Iconsax.colors_square,
                    title: AppTexts.theme,
                    subTitle: AppTexts.themeSub,
                    onTap: () => Get.bottomSheet(
                      BottomSheet(
                        onClosing: () {},
                        builder: (_) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                                title: SectionHeading(title: 'Change Theme')),
                            Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.themes.length,
                              itemBuilder: (_, index) => ListTile(
                                title: Text(controller.themes[index]),
                                trailing: Obx(() => controller.themes[index] ==
                                        controller.theme.value
                                    ? Icon(Iconsax.tick_circle,
                                        color: AppColors.primary)
                                    : SizedBox()),
                                onTap: () => controller
                                    .chnageTheme(controller.themes[index]),
                              ),
                            ),
                          ],
                        ),
                        enableDrag: false,
                      ),
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
                        onChanged: (value) =>
                            controller.toggleGeolocation(value),
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
                        onChanged: (value) =>
                            controller.toggleNotification(value),
                      ),
                    ),
                  ),

                  // Full Screen
                  Obx(
                    () => SettingsMenuTile(
                      icon: Iconsax.screenmirroring,
                      title: AppTexts.fullscreen,
                      subTitle: AppTexts.fullscreenSub,
                      trailing: Switch(
                        value: controller.fullscreen.value,
                        onChanged: (value) =>
                            controller.toggleFullscreen(value),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => profileController.logout(),
                      child: Text(AppTexts.logout),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
