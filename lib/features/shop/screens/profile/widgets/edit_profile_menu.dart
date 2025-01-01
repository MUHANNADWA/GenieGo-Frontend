import 'package:flutter/material.dart';

import 'package:geniego/utils/constants/sizes.dart';

class EditProfileMenu extends StatelessWidget {
  const EditProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.hint,
  });

  final String title;
  final IconData icon;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: hint,
                  prefixIcon: Icon(icon),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
