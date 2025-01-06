import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/shimmer/app_shimmer.dart';
import 'package:geniego/features/shop/controllers/orders/orders_controller.dart';
import 'package:geniego/features/shop/screens/order/widgets/orders_listview.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OredrsController());

    return Scaffold(
      // AppBar
      appBar: AppAppBar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),

        // Orders
        child: RefreshIndicator(
          onRefresh: () => controller.refreshOrders(),
          child: Obx(
            () => controller.isLoading.value
                ? AppShimmer(child: RoundedContainer(height: 150))
                : controller.hasError.value
                    ? AppDefaultPage(
                        image: AppImages.disconnected,
                        title: 'Oops! Orders Fetch Failed',
                        subTitle:
                            'There was an issue retrieving your Orders. Please refresh or check back in a few moments.')
                    : controller.orders.value.isEmpty
                        ? AppDefaultPage(
                            image: AppImages.disconnected,
                            title: 'Orders are Empty',
                            subTitle:
                                'It looks like you haven’t added any Orders.')
                        : OrdersListview(orders: controller.orders.value),
          ),
        ),
      ),
    );
  }
}
