import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:new_store/utils/constants/text_strings.dart';

class InternationalPhoneNumberInputField extends StatelessWidget {
  const InternationalPhoneNumberInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      inputDecoration: InputDecoration(
        labelText: AppTexts.phoneNo,
        prefixIcon: const Icon(Iconsax.call),
      ),
      searchBoxDecoration: InputDecoration(
        labelText: AppTexts.searchCountry,
        prefixIcon: const Icon(Iconsax.global_search),
      ),
      locale: Get.locale.toString(),
      initialValue: PhoneNumber(isoCode: 'SY'),
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        useBottomSheetSafeArea: true,
      ),
      onInputChanged: (PhoneNumber number) {},
    );
  }
}
