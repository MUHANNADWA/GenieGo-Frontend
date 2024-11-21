import 'package:flutter/material.dart';
import 'package:new_store/common/widgets/custom_shapes/curved_edges/custom_curved_edges.dart';

class CurvedEdges extends StatelessWidget {
  const CurvedEdges({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
