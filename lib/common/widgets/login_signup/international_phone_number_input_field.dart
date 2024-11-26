import 'package:flutter/material.dart';
import 'package:geniego/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class InternationalPhoneNumberInputField extends StatelessWidget {
  const InternationalPhoneNumberInputField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      validator: (value) => AppValidator.validatePhoneNumber(value),
      textFieldController: controller,
      inputDecoration: InputDecoration(
        labelText: AppTexts.phoneNo,
        prefixIcon: const Icon(Iconsax.call),
      ),
      searchBoxDecoration: InputDecoration(
        labelText: AppTexts.searchCountry,
        prefixIcon: const Icon(Iconsax.global_search),
      ),
      locale: AppHelper.currentLang,
      initialValue: PhoneNumber(isoCode: 'SY'),
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        useBottomSheetSafeArea: true,
      ),
      onInputChanged: (PhoneNumber number) {},
    );
  }
}
