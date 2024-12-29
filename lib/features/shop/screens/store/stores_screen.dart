import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_search_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/layouts/grid_layout.dart';
import 'package:geniego/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/models/store.dart';
import 'package:geniego/features/shop/screens/store/widgets/store_card.dart';
import 'package:geniego/features/shop/services/shop_service.dart';
import 'package:geniego/utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: Text(
          'Stores',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [CartCounterIcon(onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSizes.spaceBtwItems),

            AppSearchBar(
              searchText: 'Search for Shops...',
              showBackground: false,
              showBorder: true,
            ),

            SizedBox(height: AppSizes.spaceBtwItems),

            // Stores
            FutureBuilder(
                future: ShopService.getStores(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show shimmer loading
                    return AppShimmer(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.defaultSpace),
                        child: GridLayout(
                          crossAxisCount: 1,
                          mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (context, index) =>
                              RoundedContainer(height: 80),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    // Show the actual data
                    final dynamic stores = snapshot.data!;

                    return Padding(
                      padding: const EdgeInsets.all(AppSizes.defaultSpace),
                      child: GridLayout(
                          crossAxisCount: 1,
                          mainAxisExtent: 80,
                          itemCount: (stores['data'] as List).length,
                          itemBuilder: (context, index) {
                            final Store store =
                                Store.fromJson(stores['data'][index]);

                            return StoreCard(store: store);
                          }),
                    );
                  } else if (snapshot.hasError) {
                    // Show error message
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    // Fallback UI
                    return const SizedBox.shrink();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
