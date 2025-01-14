import 'package:flutter/material.dart';
import 'package:geniego/features/shop/models/order_model.dart';
import 'package:geniego/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key, this.order, this.totalPrice});

  final Order? order;
  final double? totalPrice;

  @override
  Widget build(BuildContext context) {
    double? pTotalPrice = totalPrice ?? order?.totalPrice;

    return Column(
      children: [
        // SubTotal
        Row(
          children: [
            Expanded(
              child: Text(
                'SubTotal',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              '\$${pTotalPrice != null ? (pTotalPrice - (pTotalPrice * 0.2)).toStringAsFixed(2) : 80}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),

        // Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${pTotalPrice != null ? (pTotalPrice * 0.15).toStringAsFixed(2) : 15}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),

        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${pTotalPrice != null ? (pTotalPrice * 0.05).toStringAsFixed(2) : 5}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sm),

        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${pTotalPrice ?? 100}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
