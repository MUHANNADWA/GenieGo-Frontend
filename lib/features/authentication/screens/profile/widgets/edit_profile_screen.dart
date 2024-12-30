import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/app_bar/app_app_bar.dart';
import 'package:geniego/common/widgets/custom_shapes/containers/app_circular_image.dart';
import 'package:geniego/common/widgets/texts/section_heading.dart';
import 'package:geniego/features/authentication/screens/profile/widgets/edit_profile_menu.dart';
import 'package:geniego/utils/constants/colors.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/sizes.dart';
import 'package:geniego/utils/constants/text_strings.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  // File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     // setState(() => this.image = imageTemporary);
  //     this.image = imageTemporary;
  //   } on PlatformException catch (e) {
  //     print('failed to pick image:$e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final User user = AuthService.currentUser;
    return Scaffold(
      // User Profile AppBar
      appBar: AppAppBar(title: Text(AppTexts.profile), showBackArrow: true),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Profile Picturep
                  const AppCircularImage(
                    image: AppImages.user,
                    height: 80,
                    width: 80,
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),

            // Details
            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            const Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            // Heading Personal Info
            const SectionHeading(title: 'Profile Information'),

            const SizedBox(height: AppSizes.spaceBtwItems),

            EditProfileMenu(title: 'First Name'),

            EditProfileMenu(title: 'Last Name'),

            EditProfileMenu(title: 'User Name'),

            EditProfileMenu(title: 'E-mail'),

            EditProfileMenu(title: 'Phone Number'),

            const Divider(),

            const SizedBox(height: AppSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: AppColors.success),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
