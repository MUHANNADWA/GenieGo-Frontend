import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/utils/constants/sizes.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = AppHelper.isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),

        const SizedBox(height: AppSizes.spaceBtwItems),

        // // Paypal
        // Row(
        //   children: [
        //     RoundedContainer(
        //       width: 60,
        //       height: 35,
        //       backgroundColor: dark ? AppColors.light : AppColors.white,
        //       padding: EdgeInsets.all(AppSizes.sm),
        //       child: Image(
        //         image: AssetImage(AppImages.paypal),
        //         fit: BoxFit.contain,
        //       ),
        //     ),
        //     const SizedBox(
        //       height: AppSizes.spaceBtwItems / 2,
        //     ),
        //     Text(
        //       'Paypal',
        //       style: Theme.of(context).textTheme.bodyLarge,
        //     ),
        //   ],
        // ),

        // Cash
        Text('Cash to the deleivery man!')
      ],
    );
  }
}
