import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/features/authentication/screens/home/widgets/home_app_bar.dart';
import 'package:geniego/features/authentication/screens/login/widgets/Section_Heading.dart';
import 'package:geniego/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  HomeAppBar(),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  // Search Bar
                  SearchContainer(text: 'Search in Store', showBorder: false),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        // -- Heading
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: AppSizes.spaceBtwItems,
                        ),

                        ///Categories
                        HomeCategoris(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
