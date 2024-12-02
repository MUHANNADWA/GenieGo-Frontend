import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const AppCircularImage(
        image: AppImages.user,
        width: 50,
        height: 50,
      ),
      title: Text(
        'Coding with T',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .apply(color: AppColors.white),
      ),
      subtitle: Text(
        'Coding with T',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: AppColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: AppColors.white,
        ),
      ),
    );
  }
}
