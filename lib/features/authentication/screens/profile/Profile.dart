import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/models/user.dart';
import 'package:geniego/features/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = AuthService.currentUser;

    return Scaffold(
      // User Profile AppBar
      appBar: AppAppBar(title: Text(AppTexts.profile)),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Profile Picture
                  const AppCircularImage(
                    image: AppImages.user,
                    height: 80,
                    width: 80,
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),

            // Details
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            const Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Heading Personal Info
            const SectionHeading(title: 'Profile Information'),

            const SizedBox(height: AppSizes.spaceBtwItems),

            ProfileMenu(title: 'Name', value: user.fullName, onPressed: () {}),

            ProfileMenu(
                title: 'Username', value: user.username, onPressed: () {}),

            ProfileMenu(
                title: 'User ID', value: user.id.toString(), onPressed: () {}),

            ProfileMenu(title: 'E-mail', value: user.email, onPressed: () {}),

            ProfileMenu(
                title: 'Phone Number', value: user.phone, onPressed: () {}),

            const Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
