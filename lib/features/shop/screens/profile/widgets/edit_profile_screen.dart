import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/shop/controllers/settings/profile_controller.dart';
import 'package:geniego/features/shop/screens/profile/widgets/edit_profile_menu.dart';
import 'package:geniego/features/shop/controllers/settings/image_picker_controller.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/validator/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImagePickerController());
    final controller = Get.put(ProfileController());

    return Scaffold(
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
                  // Profile Picture
                  Center(
                    child: Obx(
                      () => RoundedContainer(
                        radius: 100,
                        height: 80,
                        width: 80,
                        child: imageController.image.value.path == ''
                            ? Image.asset(AppImages.user)
                            : Image.file(
                                imageController.image.value,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () => imageController.imagePicker(),
                    child: TitleText(title: 'Change Profile Picture'),
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
              title: AppTexts.firstName,
              icon: Iconsax.user_edit,
              controller: controller.firstName,
            ),

            EditProfileMenu(
              title: AppTexts.lastName,
              icon: Iconsax.user_edit,
              controller: controller.lastName,
            ),

            EditProfileMenu(
              title: AppTexts.username,
              icon: Iconsax.user_edit,
              controller: controller.username,
            ),

            EditProfileMenu(
              title: AppTexts.email,
              icon: Iconsax.direct,
              controller: controller.email,
            ),

            EditProfileMenu(
              title: AppTexts.phoneNo,
              icon: Iconsax.call,
              controller: controller.phone,
            ),
            EditProfileMenu(
              title: AppTexts.password,
              icon: Iconsax.password_check,
              controller: controller.password,
              showToggle: true,
              validator: (value) =>
                  AppValidator.validateEmptyText(AppTexts.password, value),
            ),

            const SizedBox(height: AppSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save Changes'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
