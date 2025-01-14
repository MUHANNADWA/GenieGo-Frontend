import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/features/shop/screens/address/addresses_screen.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';

class AddressesController extends GetxController {
  static AddressesController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Site> addresses = <Site>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSites();
  }

  Future<void> getSites() async =>
      addresses.firstRebuild ? await fetchSites() : DoNothingAction();

  Future<void> refreshSites() async => await fetchSites();

  Future<void> fetchSites() async {
    try {
      log('Fetching Sites 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getSites();
      final addressesData = data['data'];

      addresses.value = List.generate(
        addressesData.length,
        (index) => Site.fromJson(addressesData[index]),
      );

      addresses.refresh();

      log('Sites Fetched Successfully ✅ response = ${addresses.value.map((product) => product.toJson())}');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();

      log('Error Fetching Sites ❌ error = $e');
    } finally {
      isLoading.value = false;
    }
  }

  final name = TextEditingController();
  final address = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addSite() async {
    try {
      if (!formKey.currentState!.validate()) return;

      isLoading.value = true;
      hasError.value = false;

      final siteData = {
        'name': name.text.trim(),
        'address': address.text.trim()
      };

      await ShopService.addSite(siteData);

      AppLoaders.successSnackBar(
          title: 'Added', message: 'Your Address has been added successfully!');

      addresses.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  final editName = TextEditingController();
  final editAddress = TextEditingController();

  Future<void> editSite(id) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final siteData = {
        'name': editName.text.trim(),
        'address': editAddress.text.trim()
      };

      await ShopService.updateSiteById(id, siteData);

      AppLoaders.successSnackBar(
          title: 'Updated',
          message: 'Your Address has been updated successfully!');

      addresses.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteSiteById(id) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      await ShopService.deleteSiteById(id);

      AppLoaders.errorSnackBar(
          title: 'Removed',
          message: 'Your Address has been Removed successfully!');
      addresses.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Site activeAddress = AppHelper.exampleSite;
  changeAddress() {
    Get.to(() => AddressScreen(), fullscreenDialog: true);
  }
}
