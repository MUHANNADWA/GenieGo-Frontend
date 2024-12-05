import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // User Profile AppBar
      appBar: const AppAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

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
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),

            const Divider(),

            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            // Heading Profile Info
            const SectionHeading(
                title: 'Profile Information', showActionButton: false),

            const SizedBox(height: AppSizes.spaceBtwItems),

            ProfileMenu(
              title: 'Name',
              value: 'Name',
              onPressed: () {},
            ),

            ProfileMenu(
              title: 'Username',
              value: 'user name',
              onPressed: () {},
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            const Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Heading Personal Info
            const SectionHeading(
              title: 'Profile Information',
              showActionButton: false,
            ),

            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            ProfileMenu(
              title: 'Name',
              value: 'user name',
              onPressed: () {},
            ),

            ProfileMenu(
                title: 'User ID',
                value: '45689',
                icon: Iconsax.copy,
                onPressed: () {}),

            ProfileMenu(
                title: 'E-mail', value: 'coding_with_t', onPressed: () {}),

            ProfileMenu(
                title: 'Phone Number',
                value: '+92-317-8059528',
                onPressed: () {}),

            ProfileMenu(
              title: 'Gender',
              value: 'Male',
              onPressed: () {},
            ),

            ProfileMenu(
                title: 'Date of Birth',
                value: '18 Oct, 1994',
                onPressed: () {}),

            const Divider(),

            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

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
