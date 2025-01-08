import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
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

  Future<void> addSite() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final siteData = {
        //
      };

      await ShopService.addSite(siteData);

      addresses.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editSite(id) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final siteData = {
        //
      };

      await ShopService.updateSiteById(id, siteData);

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

      addresses.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
