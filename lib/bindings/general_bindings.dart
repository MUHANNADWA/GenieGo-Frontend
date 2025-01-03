import 'package:geniego/features/shop/controllers/cart/cart_controller.dart';
import 'package:geniego/utils/helpers/network_manager.dart';
import 'package:geniego/utils/local_storage/storage_utility.dart';
import 'package:geniego/utils/locale/locale_controller.dart';
import 'package:geniego/utils/theme/theme_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AppLocaleController());
    Get.put(AppLocalStorage());
    Get.put(AppThemeController());
    Get.put(CartController(), permanent: true);
  }
}
