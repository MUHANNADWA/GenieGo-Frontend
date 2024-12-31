import 'package:geniego/features/shop/models/product_model.dart';
import 'package:geniego/utils/local_storage/storage_utility.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  // Variables
  final favourites = <int, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method To Initialize Favourites By Reading From Storage
  Future<void> initFavourites() async {
    final json = AppLocalStorage.instance.readData('favourites');
    print('hiiiii json = $json');
    print('json hiiiiiiiiiiii = $json');
    if (json != null) {
      final Map<int, dynamic> storedFavourites = json;
      print('storedFavourites hiiiiiiiiii = $json');
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
      print('favourites hiiiiiiiiii = $favourites');
    } else {}
  }

  bool isFavourite(int productId) => favourites.containsKey(productId);

  void toggleFavouriteProduct(int productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      favourites.refresh();
      AppLoaders.successSnackBar(
          title: 'Product Has Been Added To The WishList');
    } else {
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      AppLoaders.errorSnackBar(title: 'Product Has Been Removed From WishList');
    }
  }

  void saveFavouritesToStorage() async {
    print('hiiiii ${favourites.value}');
    await AppLocalStorage.instance.saveData('favourites', favourites.value);
    final s = AppLocalStorage.instance.readData('favourites');
    print('hiiiii stored = $s');
  }

  Stream<List<Product>> favouriteProducts() {
    final List<Product> favouriteProducts = List.generate(
        favourites.length, (index) => Product.fromJson(favourites[index]));

    return Stream.value(favouriteProducts);
  }
}
