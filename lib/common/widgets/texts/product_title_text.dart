import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.bigSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.start,
    this.color,
  });

  final String title;
  final bool smallSize;
  final bool bigSize;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge!.apply(color: color)
          : bigSize
              ? Theme.of(context).textTheme.headlineLarge!.apply(color: color)
              : Theme.of(context).textTheme.titleSmall!.apply(color: color),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
