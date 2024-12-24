import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/texts/product_price_text.dart';
import 'package:geniego/common/widgets/texts/product_title_text.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelper.isDarkMode;
    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        RoundedContainer(
          padding: EdgeInsets.all(AppSizes.md),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            children: [
              /// Title, Price, & Stock Status
              Row(
                children: [
                  SectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Column(
                    children: [
                      Row(
                        children: [
                          ProductStoreTitleText(
                            title: 'Price :',
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: AppSizes.spaceBtwItems),

                          /// Sale Price
                          ProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductStoreTitleText(
                            title: 'Stock',
                            smallSize: true,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),

              /// Variation Description
              ProductStoreTitleText(
                title:
                    'This IS The Description Of The Product It Can Go Up To 4 Lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        /// -- Attributes
      ],
    );
  }
}
