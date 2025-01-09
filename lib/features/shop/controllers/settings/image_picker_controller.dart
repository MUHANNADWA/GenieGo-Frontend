import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final Rxn<File> image = Rxn<File>();
  final RxBool isLoading = false.obs;

  // Pick Image Function
  Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      isLoading.value = true;

      final imagePick = await ImagePicker().pickImage(source: source);
      if (imagePick != null) {
        final selectedImage = File(imagePick.path);
        image.value = selectedImage;
        return selectedImage;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
