import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/models/store_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';

class DashboardStoreController extends GetxController {
  static DashboardStoreController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  RxList<Product> products = <Product>[].obs;
  RxList<Store> stores = <Store>[].obs;

  Future<void> fetchDashboardItems() async {
    try {
      log('Fetching Products and Stores in Dashboard 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getStoreById(1);
      final List<dynamic> productsData = data['data']['products'] ?? [];
      final List<dynamic> storesData = data['data']['stores'] ?? [];

      products.value = List.generate(
        productsData.length,
        (index) => Product.fromJson(productsData[index]),
      );

      stores.value = List.generate(
        storesData.length,
        (index) => Store.fromJson(storesData[index]),
      );

      products.refresh();
      stores.refresh();

      log('Dashboard for Products and Stores Fetched Successfully ✅ response = ${products.value.map((product) => product.toJson())}');
    } catch (e) {
      log('Error Fetching Products and Stores in Dashboard ❌ error = $e');

      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Add Store

  final englishName = TextEditingController();
  final arabicName = TextEditingController();
  final englishDescription = TextEditingController();
  final arabicDescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addStore({File? storeImage}) async {
    try {
      // Form Validation
      if (!formKey.currentState!.validate()) return;

      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Adding your Store..',
        'Go relax and eat a Falafel Sandwich!',
        AppImages.loading,
      );

      final data = {
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

      // storeImage != null
      await ShopService.addStore(data);
      // await ShopService.updateStoreByIdWithImage(id, data, storeImage)

      // Stop Loading
      AppDialogs.hideDialog();

      AppLoaders.infoSnackBar(
          title: 'Saved!', message: 'Your Store Has Been Added Successfully');
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Update Store
  final editEnglishName = TextEditingController();
  final editArabicName = TextEditingController();
  final editEnglishDescription = TextEditingController();
  final editArabicDescription = TextEditingController();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  Future<void> updateStore(id, {File? storeImage}) async {
    try {
      // Form Validation
      if (!formKey.currentState!.validate()) return;

      // Start Loading
      AppDialogs.showFullScreenLoadingDialog(
        'Updating your Store..',
        'Go relax and eat a Falafel Sandwich!',
        AppImages.loading,
      );

      final data = {
        'first_name': editEnglishName.text.trim(),
        'last_name': editArabicName.text.trim(),
        'username': editEnglishDescription.text.trim(),
        'email': editArabicDescription.text.trim(),
      };

      storeImage != null
          ? await ShopService.updateStoreByIdWithImage(id, data, storeImage)
          : await ShopService.updateStoreById(id, data);

      // Stop Loading
      AppDialogs.hideDialog();

      AppLoaders.infoSnackBar(
          title: 'Saved!', message: 'Your Info Has Been Updated');
    } catch (e) {
      await AppDialogs.hideDialog();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
