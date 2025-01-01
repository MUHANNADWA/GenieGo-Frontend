import 'package:flutter/material.dart';
import 'package:geniego/features/authentication/controllers/signup/signup_controller.dart';
import 'package:get/get.dart';
import 'package:geniego/utils/constants/sizes.dart';

class EditProfileMenu extends StatelessWidget {
  EditProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.hint,
    this.showToggle = false,
  });
  final controller = Get.put(SignupController());
  final String title, hint;
  final bool showToggle;
  final IconData icon;
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
                  suffixIcon: showToggle
                      ? IconButton(
                          icon: controller.passwordIcon.value,
                          onPressed: () =>
                              controller.togglePasswordVisibility(),
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
