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
            Positioned(
              top: -150,
              right: -250,
              child: RoundedContainer(
                height: 400,
                width: 400,
                radius: 400,
                backgroundColor: AppColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: RoundedContainer(
                height: 400,
                width: 400,
                radius: 400,
                backgroundColor: AppColors.textWhite.withOpacity(0.1),
              ),
            ),

            // Child
            child,
          ],
        ),
      ),
    );
  }
}
