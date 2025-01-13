import 'package:flutter/material.dart';
import 'package:geniego/utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
    this.leadingWidget,
  });

  final IconData? icon;
  final Widget? leadingWidget;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingWidget ??
          Icon(
            icon,
            size: 28,
            color: AppColors.primary,
          ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
