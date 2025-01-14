import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/features/shop/controllers/settings/profile_controller.dart';
import 'package:geniego/features/shop/screens/profile/widgets/edit_profile_screen.dart';
import 'package:geniego/features/shop/screens/profile/widgets/profile_menu.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final User user = AuthService.currentUser;

    return Scaffold(
      appBar: AppAppBar(title: Text(AppTexts.profile), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(children: [
            RoundedContainer(
              width: 80,
              height: 80,
              radius: 100,
              child: user.image == AppImages.user
                  ? Image.asset(AppImages.user)
                  : CachedNetworkImage(
                      imageUrl: user.image,
                      fit: BoxFit.cover,
                    ),
            ),

            // Details
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            const Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Heading Personal Info
            const SectionHeading(title: 'Profile Information'),

            const SizedBox(height: AppSizes.spaceBtwItems),

            ProfileMenu(title: 'Name', value: user.fullName),

            ProfileMenu(title: 'Username', value: user.username),

            ProfileMenu(title: 'User ID', value: user.id.toString()),

            ProfileMenu(title: 'E-mail', value: user.email),

            ProfileMenu(title: 'Phone Number', value: user.phone),

            Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => EditProfileScreen()),
                child: const Text('Edit Profile'),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => controller.deleteAccount(user.id),
                child: const Text('Delete Account'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
