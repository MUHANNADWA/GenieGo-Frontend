import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
import 'package:geniego/utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [CartCounterIcon(onPressed: () {})],
      ),
      body: Column(
        children: [
          AppSearchBar(
            searchText: 'searchText',
            showBackground: false,
            showBorder: true,
          ),

          // Stores
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: GridLayout(
              mainAxisExtent: 80,
              itemCount: 5,
              itemBuilder: (context, index) => StoreCard(),
            ),
          ),
        ],
      ),
    );
  }
}