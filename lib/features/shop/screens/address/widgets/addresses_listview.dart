import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/site_model.dart';
import 'package:geniego/features/shop/screens/address/widgets/address_box.dart';
import 'package:geniego/utils/constants/sizes.dart';

class AddressesListview extends StatelessWidget {
  const AddressesListview({super.key, required this.addresses});

  final List<Site> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: addresses.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSizes.sm),
      itemBuilder: (_, index) => AddressBox(address: addresses[index]),
    );
  }
}
