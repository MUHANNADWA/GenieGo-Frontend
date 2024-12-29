import 'package:flutter/material.dart';
import 'package:geniego/common/pages/app_default_page.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/helpers/network_manager.dart';
import 'package:geniego/utils/popups_loaders/app_dialogs.dart';
import 'package:geniego/utils/popups_loaders/loaders.dart';

class NoInternetConnentionPage extends StatelessWidget {
  const NoInternetConnentionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDefaultPage(
          image: AppImages.noInternet,
          title: AppTexts.noInternetTitle,
          subTitle: AppTexts.noInternetSubTitle,
          showActionButton: true,
          actionButtonText: AppTexts.retryConnect,
          onPressedActionButton: () async {
            try {
              AppDialogs.showLoadingDialog();
              final isConnected = await NetworkManager.instance.isConnected();
              if (!isConnected) {
                AppLoaders.errorSnackBar(
                  title: AppTexts.noInternetSnackBarTitle,
                  message: AppTexts.noInternetSnackBarMessage,
                );
                return;
              }
              AppDialogs.hideDialog();
            } finally {
              AppDialogs.hideDialog();
            }
          },
        ),
      ],
    );
  }
}
