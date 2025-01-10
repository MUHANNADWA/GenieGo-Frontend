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
      appBar: AppAppBar(title: Text(AppTexts.profile), showBackArrow: true),

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
                              ? Image.asset(AppImages.user)
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
              const SectionHeading(title: 'Product Information'),

              const SizedBox(height: AppSizes.spaceBtwItems),

              EditProfileMenu(
                title: 'English Name',
                icon: Iconsax.document,
                controller: controller.editEnglishName,
              ),

              EditProfileMenu(
                title: 'Arabic Name',
                icon: Iconsax.document,
                controller: controller.editArabicName,
              ),

              EditProfileMenu(
                title: 'English Description',
                icon: Iconsax.archive,
                controller: controller.editEnglishDescription,
              ),

              EditProfileMenu(
                title: 'Arabic Description',
                icon: Iconsax.archive,
                controller: controller.editArabicDescription,
              ),
              EditProfileMenu(
                title: 'Price',
                icon: Iconsax.dollar_circle,
                controller: controller.editPrice,
                showToggle: true,
                validator: (value) =>
                    AppValidator.validateEmptyText(AppTexts.password, value),
              ),
              EditProfileMenu(
                title: 'Quantity',
                icon: Iconsax.add4,
                controller: controller.editQuantity,
                showToggle: true,
                validator: (value) =>
                    AppValidator.validateEmptyText(AppTexts.password, value),
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.addProduct(),
                  child: const Text('Add Product'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
