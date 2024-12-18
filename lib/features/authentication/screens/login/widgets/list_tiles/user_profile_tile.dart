import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    this.showEditButton = true,
  });

  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(profileScreen),
      leading: const AppCircularImage(
        image: AppImages.user,
        width: 50,
        height: 50,
      ),

      // User Email
      title: Text(
        'useremail@example.com',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .apply(color: AppColors.white),
      ),

      // User Name
      subtitle: Text(
        'User Name',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: AppColors.white),
      ),

      // Edit Button
      trailing: showEditButton
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.edit,
                color: AppColors.white,
              ),
            )
          : null,
    );
  }
}
