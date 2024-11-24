// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/device/device_utility.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final bool showBackArrow;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: title,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: AppHelper.isRtl
                    ? const Icon(Iconsax.arrow_right)
                    : const Icon(Iconsax.arrow_left),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  )
                : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.appBarHeight);
}
