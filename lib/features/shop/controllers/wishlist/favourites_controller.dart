import 'dart:developer';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Product> favourites = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFavourites();
  }

  Future<void> getFavourites() async =>
      favourites.firstRebuild ? await fetchFavourites() : DoNothingAction();

  Future<void> refreshFavourites() async => await fetchFavourites();

  Future<void> fetchFavourites() async {
    try {
      log('Fetching Favourites 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getFavourites();
      final favouritesData = data['data'];

      favourites.value = List.generate(
        favouritesData.length,
        (index) => Product.fromJson(favouritesData[index]),
      );

      favourites.refresh();

      log('Favourites Fetched Successfully ✅');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();

      log('Error Fetching Favourites ❌ $e');
    } finally {
      isLoading.value = false;
    }
  }

  bool isFavourite(int productId) => false;

  void toggleFavouriteProduct(int productId) async {
    if (!isFavourite(productId)) {
      await Isolate.run(() async {
        // Initialize Isolate
        BackgroundIsolateBinaryMessenger.ensureInitialized(
            RootIsolateToken.instance!);
        ShopService.addToFavourites(productId);
      });
      AppLoaders.successSnackBar(
        title: 'Added',
        message: 'Product Has Been Added To The WishList',
      );
    } else {
      await Isolate.run(
          () async => ShopService.removeFromFavourites(productId));
      AppLoaders.errorSnackBar(
        title: 'Removed',
        message: 'Product Has Been Removed From WishList',
      );
    }
  }
}
