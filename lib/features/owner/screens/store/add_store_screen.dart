import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/owner/controllers/store/dashboard_store_controller.dart';
import 'package:geniego/features/shop/screens/profile/widgets/edit_profile_menu.dart';
import 'package:geniego/features/shop/controllers/settings/image_picker_controller.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddStoreScreen extends StatelessWidget {
  const AddStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImagePickerController());
    final controller = Get.put(DashboardStoreController());

    return Scaffold(
      appBar: AppAppBar(title: Text(AppTexts.addStore), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
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
                          child: imageController.image.value == null
                              ? Image.asset(AppImages.appLogo)
                              : Image.file(
                                  imageController.image.value!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () => imageController.pickImage(),
                      child: TitleText(title: 'Change Store Picture'),
                    ),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),

              const Divider(),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Heading Personal Info
              SectionHeading(title: AppTexts.storeInformation),

              const SizedBox(height: AppSizes.spaceBtwItems),

              EditProfileMenu(
                title: AppTexts.englishName,
                icon: Iconsax.document,
                controller: controller.englishName,
              ),

              EditProfileMenu(
                title: AppTexts.arabicName,
                icon: Iconsax.document,
                controller: controller.arabicName,
              ),

              EditProfileMenu(
                title: AppTexts.englishDescription,
                icon: Iconsax.archive,
                controller: controller.englishDescription,
              ),

              EditProfileMenu(
                title: AppTexts.arabicDescription,
                icon: Iconsax.archive,
                controller: controller.arabicDescription,
              ),

              SizedBox(height: AppSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.addStore(
                      storeImage: imageController.image.value),
                  child: Text(AppTexts.addStore),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
