import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/owner/controllers/product/dashboard_product_controller.dart';
import 'package:geniego/features/shop/screens/profile/widgets/edit_profile_menu.dart';
import 'package:geniego/features/shop/controllers/settings/image_picker_controller.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/validator/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImagePickerController());
    final controller = Get.put(DashboardProductController());

    return Scaffold(
      appBar: AppAppBar(title: Text(AppTexts.addProduct), showBackArrow: true),

      // Body
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
                    // Product  Picture
                    Center(
                      child: Obx(
                        () => RoundedContainer(
                          radius: 100,
                          height: 80,
                          width: 80,
                          child: imageController.image.value == null
                              ? Image.asset(AppImages.productImage)
                              : Image.file(
                                  imageController.image.value!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () => imageController.pickImage(),
                      child: TitleText(title: 'Change Product Picture'),
                    ),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),

              const Divider(),

              const SizedBox(height: AppSizes.spaceBtwItems),

              // Heading Personal Info
              SectionHeading(title: AppTexts.productInformation),

              const SizedBox(height: AppSizes.spaceBtwItems),

              EditProfileMenu(
                title: AppTexts.englishName,
                icon: Iconsax.document,
                controller: controller.englishName,
                validator: (value) =>
                    AppValidator.validateEmptyText(AppTexts.englishName, value),
              ),

              EditProfileMenu(
                title: AppTexts.arabicName,
                icon: Iconsax.document,
                controller: controller.arabicName,
                validator: (value) =>
                    AppValidator.validateEmptyText(AppTexts.arabicName, value),
              ),

              EditProfileMenu(
                title: AppTexts.englishDescription,
                icon: Iconsax.archive,
                controller: controller.englishDescription,
                validator: (value) => AppValidator.validateEmptyText(
                    AppTexts.englishDescription, value),
              ),

              EditProfileMenu(
                title: AppTexts.arabicDescription,
                icon: Iconsax.archive,
                controller: controller.arabicDescription,
                validator: (value) => AppValidator.validateEmptyText(
                    AppTexts.arabicDescription, value),
              ),
              EditProfileMenu(
                title: AppTexts.price,
                icon: Iconsax.dollar_square,
                controller: controller.price,
                validator: (value) =>
                    AppValidator.validateEmptyText(AppTexts.price, value),
              ),
              EditProfileMenu(
                title: AppTexts.quantity,
                icon: Iconsax.add_square,
                controller: controller.quantity,
                validator: (value) =>
                    AppValidator.validateEmptyText(AppTexts.quantity, value),
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.addProduct(),
                  child: Text(AppTexts.addProduct),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
