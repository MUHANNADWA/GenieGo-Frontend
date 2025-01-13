import 'dart:developer';
import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxList<Product> favourites = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWishlist();
  }

  bool isFavourite(int productId) =>
      favourites.any((product) => product.id == productId);

  Future<void> fetchWishlist() async {
    try {
      log('Fetching Wishlist 🔄');
      isLoading.value = true;
      hasError.value = false;

      final data = await ShopService.getWishlist();
      final favouritesData = data['data'];

      favourites.value = List.generate(
        favouritesData.length,
        (index) => Product.fromJson(favouritesData[index]),
      );

      favourites.refresh();

      log('Wishlist Fetched Successfully ✅ response = ${favourites.value.map((product) => product.toJson())}');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();

      log('Error Fetching Wishlist ❌ error = $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addToWishlist(productId) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      await ShopService.addToWishlist(productId);

      favourites.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFromWishlist(productId) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      await ShopService.removeFromWishlist(productId);

      favourites.refresh();
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavouriteProduct(int productId) async {
    if (!isFavourite(productId)) {
      await addToWishlist(productId);

      AppLoaders.successSnackBar(
        title: 'Added',
        message: 'Product Has Been Added To The WishList',
      );
      fetchWishlist();
      update();
    } else {
      await removeFromWishlist(productId);

      AppLoaders.errorSnackBar(
        title: 'Removed',
        message: 'Product Has Been Removed From WishList',
      );
      fetchWishlist();
      update();
    }
  }
}
