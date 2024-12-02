import 'package:flutter/material.dart';
import 'package:geniego/bindings/general_bindings.dart';
import 'package:geniego/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/locale/locale.dart';
import 'package:geniego/utils/locale/locale_controller.dart';
import 'package:geniego/utils/theme/theme.dart';

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
      initialBinding: GeneralBindings(),
      // home: const OnBoardingScreen(),
      home: const NavigationMenu(),
    );
  }
}
