import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/controllers/login/login_controller.dart';
import 'package:geniego/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:geniego/features/authentication/controllers/signup/signup_controller.dart';
import 'package:geniego/utils/validator/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class InternationalPhoneNumberInputField<T extends GetxController>
    extends StatelessWidget {
  const InternationalPhoneNumberInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final T tController = Get.find<T>();

    return Obx(
      () => InternationalPhoneNumberInput(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => AppValidator.validatePhoneNumber(value),
        inputDecoration: InputDecoration(
          labelText: AppTexts.phoneNo,
          prefixIcon: const Icon(Iconsax.call),
        ),
        searchBoxDecoration: InputDecoration(
          labelText: AppTexts.searchCountry,
          prefixIcon: const Icon(Iconsax.global_search),
        ),
        locale: AppHelper.currentLang,
        initialValue: PhoneNumber(isoCode: controller.countryCode.value),
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          useBottomSheetSafeArea: true,
        ),
        onInputChanged: (PhoneNumber number) {
          if (tController is LoginController) {
            (tController as LoginController).phoneNumber.value =
                number.phoneNumber ?? '';
          } else if (tController is SignupController) {
            (tController as SignupController).phoneNumber.value =
                number.phoneNumber ?? '';
          }
        },
      ),
    );
  }
}
