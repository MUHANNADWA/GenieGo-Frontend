import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/common/widgets/custom_shapes/curved_edges/curved_edge.dart';
import 'package:geniego/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdges(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            // Rounded Containers
            const Positioned(
              top: -150,
              right: -250,
              child: RoundedContainer(),
            ),
            const Positioned(
              top: 100,
              right: -300,
              child: RoundedContainer(),
            ),

            // Child
            child,
          ],
        ),
      ),
    );
  }
}
