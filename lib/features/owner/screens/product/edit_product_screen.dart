import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/owner/controllers/product/dashboard_product_controller.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/screens/profile/widgets/edit_profile_menu.dart';
import 'package:geniego/features/shop/controllers/settings/image_picker_controller.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImagePickerController());
    final controller = Get.put(DashboardProductController());

    return Scaffold(
      appBar: AppAppBar(title: Text(AppTexts.editProduct), showBackArrow: true),

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
                      child: RoundedContainer(
                        radius: 100,
                        height: 80,
                        width: 80,
                        child: Obx(
                          () => imageController.image.value != null
                              ? Image.file(
                                  imageController.image.value!,
                                  fit: BoxFit.cover,
                                )
                              : product.image != AppImages.productImage
                                  ? CachedNetworkImage(
                                      imageUrl: product.image,
                                      fit: BoxFit.cover)
                                  : Image.asset(
                                      AppImages.productImage,
                                      fit: BoxFit.cover,
                                    ),
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () => imageController.pickImage(),
                      child: TitleText(title: AppTexts.productPicture),
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
                controller: controller.editEnglishName,
              ),

              EditProfileMenu(
                title: AppTexts.arabicName,
                icon: Iconsax.document,
                controller: controller.editArabicName,
              ),

              EditProfileMenu(
                title: AppTexts.englishDescription,
                icon: Iconsax.archive,
                controller: controller.editEnglishDescription,
              ),

              EditProfileMenu(
                title: AppTexts.arabicDescription,
                icon: Iconsax.archive,
                controller: controller.editArabicDescription,
              ),

              EditProfileMenu(
                title: AppTexts.price,
                icon: Iconsax.dollar_circle,
                controller: controller.editPrice,
                keyboardType: TextInputType.number,
              ),

              EditProfileMenu(
                title: AppTexts.quantity,
                icon: Iconsax.add_square,
                controller: controller.editQuantity,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateProduct(product.id,
                      productImage: imageController.image.value),
                  child: Text(AppTexts.saveProductInfo),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
