import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppCircularImage(
        image: AppImages.user,
        width: 50,
        height: 50,
      ),
      title: Text(
        'Coding with T',
        style:
            Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
      ),
      subtitle: Text(
        'Coding with T',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
