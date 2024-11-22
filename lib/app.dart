import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_store/features/authentication/screens/onboarding/on_boarding_screen.dart';
import 'package:new_store/utils/constants/text_strings.dart';
import 'package:new_store/utils/locale/locale.dart';
import 'package:new_store/utils/locale/locale_controller.dart';
import 'package:new_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocaleController langController = Get.put(AppLocaleController());
    return GetMaterialApp(
      title: AppTexts.appName,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: langController.initialLang(),
      translations: AppLocale(),
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
    );
  }
}
