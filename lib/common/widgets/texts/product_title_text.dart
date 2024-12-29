import 'package:flutter/material.dart';

class ProductStoreTitleText extends StatelessWidget {
  const ProductStoreTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.bigSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final bool smallSize;
  final bool bigSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : bigSize
              ? Theme.of(context).textTheme.headlineLarge
              : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
