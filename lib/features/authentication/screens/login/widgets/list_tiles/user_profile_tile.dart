import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:geniego/features/authentication/models/user_model.dart';
import 'package:geniego/features/shop/screens/profile/widgets/edit_profile_screen.dart';
import 'package:geniego/features/authentication/services/auth_service.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key, this.showEditButton = true});

  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    final User user = AuthService.currentUser;

    return ListTile(
      onTap: () => Get.toNamed(profileScreen),
      leading: RoundedContainer(
        width: 50,
        height: 50,
        radius: 100,
        child: user.image == AppImages.user
            ? Image.asset(AppImages.productImage)
            : CachedNetworkImage(
                imageUrl: user.image,
                fit: BoxFit.cover,
              ),
      ),

      // User Email
      title: Text(
        user.email,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .apply(color: AppColors.white),
      ),

      // User Name
      subtitle: Text(
        user.fullName,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: AppColors.white),
      ),

      // Edit Button
      trailing: showEditButton
          ? IconButton(
              onPressed: () => Get.to(() => EditProfileScreen()),
              icon: const Icon(
                Iconsax.edit,
                color: AppColors.white,
              ),
            )
          : null,
    );
  }
}
