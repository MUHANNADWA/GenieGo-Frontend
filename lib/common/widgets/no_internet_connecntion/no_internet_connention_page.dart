import 'package:flutter/material.dart';
import 'package:geniego/common/widgets/default_page/app_default_page.dart';
import 'package:geniego/utils/constants/image_strings.dart';
import 'package:geniego/utils/helpers/network_manager.dart';
import 'package:geniego/utils/popups/app_dialogs.dart';
import 'package:geniego/utils/popups/loaders.dart';

class NoInternetConnentionPage extends StatelessWidget {
  const NoInternetConnentionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDefaultPage(
          image: AppImages.noInternet,
          title: 'Uh-oh! You\'re Offline.',
          subTitle:
              'It seems like there\'s no internet. Reconnect to continue.',
          showActionButton: true,
          actionButtonText: 'Retry to connect',
          onPressedActionButton: () async {
            try {
              AppDialogs.showLoadingDialog();
              final isConnected = await NetworkManager.instance.isConnected();
              if (!isConnected) {
                AppLoaders.errorSnackBar(
                  title: 'Can\'t connect to network',
                  message: 'Please check your network connection again',
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
