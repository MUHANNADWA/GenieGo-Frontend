import 'dart:convert';

import 'package:geniego/features/shop/controllers/settings/settings_controller.dart';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/utils/local_storage/storage_utility.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  // Variables
  final favourites = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method To Initialize Favourites By Reading From Storage
  Future<void> initFavourites() {
    final json = AppLocalStorage.instance.readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      AppLoaders.successSnackBar(
          title: 'Product Has Been Added To The WishList');
    } else {
      AppLocalStorage.instance.removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      AppLoaders.errorSnackBar(title: 'Product Has Been Removed From WishList');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    AppLocalStorage.instance.saveData('favourites', encodedFavourites);
  }

  // Future<List<Product>> favouriteProducts() async {
  //   return await ;
  // }
}
