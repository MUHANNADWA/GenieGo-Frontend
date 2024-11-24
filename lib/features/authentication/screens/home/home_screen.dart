import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:geniego/features/authentication/screens/home/widgets/home_app_bar.dart';

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
                  // App Bar
                  HomeAppBar(),

                  // Search Bar

                  // Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
