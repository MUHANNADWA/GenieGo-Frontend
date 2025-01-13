import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';

class DashboardProductController extends GetxController {
  static DashboardProductController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Product> stores = <Product>[].obs;

  Future<void> fetchDashboardItems() async {
    try {
      log('Fetching Products and Products in Dashboard 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getProductById(1);
      final List<dynamic> productsData = data['data']['products'] ?? [];
      final List<dynamic> storesData = data['data']['stores'] ?? [];

      products.value = List.generate(
        productsData.length,
        (index) => Product.fromJson(productsData[index]),
      );

      stores.value = List.generate(
        storesData.length,
        (index) => Product.fromJson(storesData[index]),
      );

      products.refresh();
      stores.refresh();

      log('Dashboard for Products and Products Fetched Successfully ✅ response = ${products.value.map((product) => product.toJson())}');
    } catch (e) {
      log('Error Fetching Products and Products in Dashboard ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Add Product

  final englishName = TextEditingController();
  final arabicName = TextEditingController();
  final englishDescription = TextEditingController();
  final arabicDescription = TextEditingController();
  final price = TextEditingController();
  final quantity = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addProduct({File? productImage}) async {
    try {
      // Form Validation
      if (!formKey.currentState!.validate()) return;

      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Adding your Product..',
        'Go relax and eat a Falafel Sandwich!',
        AppImages.loading,
      );

      final data = {
        'price': price.text.trim(),
        'stock': quantity.text.trim(),
        'translations': {
          'en': {
            'name': englishName.text.trim(),
            'description': englishDescription.text.trim()
          },
          'ar': {
            'name': arabicName.text.trim(),
            'description': arabicDescription.text.trim()
          }
        }
      };

      final response = await ShopService.addProduct(data);

      Map? responseImage;
      if (productImage != null) {
        responseImage = await ShopService.updateProductImageById(
            response['data']['id'], productImage);
      }

      final product = Product.fromJson(response['data']);
      product.image =
          responseImage?['data']['icon_url'] ?? AppImages.productImage;

      // Stop Loading
      AppDialogs.hideDialog();

      AppLoaders.infoSnackBar(
          title: 'Saved!', message: 'Your Product Has Been Added Successfully');
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Update Product

  final editEnglishName = TextEditingController();
  final editArabicName = TextEditingController();
  final editEnglishDescription = TextEditingController();
  final editArabicDescription = TextEditingController();
  final editPrice = TextEditingController();
  final editQuantity = TextEditingController();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  Future<void> updateProduct(id, {File? productImage}) async {
    try {
      // Form Validation
      if (!formKey.currentState!.validate()) return;

      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Updating your Product..',
        'Go relax and eat a Falafel Sandwich!',
        AppImages.loading,
      );

      final data = {
        'price': editPrice.text.trim(),
        'stock': editQuantity.text.trim(),
        'translations': {
          'en': {
            'name': editEnglishName.text.trim(),
            'description': editEnglishDescription.text.trim()
          },
          'ar': {
            'name': editArabicName.text.trim(),
            'description': editArabicDescription.text.trim()
          }
        }
      };

      Map? responseImage;
      if (productImage != null) {
        responseImage =
            await ShopService.updateProductImageById(id, productImage);
      }

      final response = await ShopService.updateProductById(id, data);

      final product = Product.fromJson(response['data']);
      product.image =
          responseImage?['data']['icon_url'] ?? AppImages.productImage;

      // Stop Loading
      AppDialogs.hideDialog();

      AppLoaders.infoSnackBar(
          title: 'Saved!', message: 'Your Info Has Been Updated');
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> deleteProduct(id) async {
    try {
      AppDialogs.showConfirmationDialog(
        title: 'Confirm Deletion',
        description:
            'Are you sure you want to delete your Product? This action cannot be undone.',
        confirmText: 'Delete',
        onConfirm: () async {
          Get.back();
          await ShopService.deleteProductById(id);
          AppLoaders.errorSnackBar(
              title: 'Deleted!',
              message: 'Your Product Has been Deleted Successfully');
          Get.offAllNamed(mainScreen);
        },
      );
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
