import 'package:flutter/material.dart';
import 'package:geniego/app.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/profile/widgets/edit_profile_menu.dart';
import 'package:geniego/features/shop/controllers/settings/image_picker_controller.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());
    // final User user = AuthService.currentUser;
    return Scaffold(
      // User Profile AppBar
      appBar: AppAppBar(title: Text(AppTexts.profile), showBackArrow: true),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Profile Picturep
                  Center(
                    child: Obx(
                      () => Container(
                        child: controller.image.value.path == ''
                            ? Image.asset(AppImages.user)
                            : Image.file(controller.image.value),
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      controller.imagePicker();
                    },
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

            EditProfileMenu(
              title: 'First Name',
              icon: Iconsax.user_edit,
              hint: 'First Name',
            ),

            EditProfileMenu(
              title: 'Last Name',
              icon: Iconsax.user_edit,
              hint: 'Last Name',
            ),

            EditProfileMenu(
              title: 'User Name',
              icon: Iconsax.user_edit,
              hint: 'User Name',
            ),

            EditProfileMenu(
              title: 'E-mail',
              icon: Iconsax.direct,
              hint: 'E-mail',
            ),

            EditProfileMenu(
              title: 'Phone Number',
              icon: Iconsax.call,
              hint: 'Phone Number',
            ),
            EditProfileMenu(
              title: 'Password',
              icon: Iconsax.password_check,
              hint: 'Password',
            ),

            const Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: AppColors.success),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
