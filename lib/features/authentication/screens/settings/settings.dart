import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/settings_menu_tile.dart';
import 'package:geniego/features/authentication/screens/login/widgets/list_tiles/user_profile_tile.dart';
import 'package:geniego/features/authentication/screens/profile/profile.dart';
import 'package:geniego/features/shop/screens/address/widgets/address.dart';
import 'package:geniego/features/shop/screens/order/order.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      'Account',
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
                  UserProfileTile(
                    onTap: () => Get.to(() => const ProfileScreen()),
                  ),

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
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),

                  // My Adresses
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery  address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),

                  // My Cart
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add,Remove products and move to checkout',
                    onTap: () {},
                  ),

                  // My Orders
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),

                  // Bank Account
                  SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to register bank account',
                    onTap: () {},
                  ),

                  // My Coupons
                  SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My coupons',
                    subTitle: 'List of all discounted coupons',
                    onTap: () {},
                  ),

                  // Notifications
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of Notification message',
                    onTap: () {},
                  ),

                  // Account Privacy
                  SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connect accounts',
                    onTap: () {},
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  //* App Settings

                  // App Settings Heading
                  const SectionHeading(
                    title: 'appsettings',
                    showActionButton: false,
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),

                  // Load Data
                  const SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud firebase',
                  ),

                  // Geolocation
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on locaion',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  // Safe Mode
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  // HD Image Quality
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set Image Quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
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
