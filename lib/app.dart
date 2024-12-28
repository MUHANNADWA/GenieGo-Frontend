import 'package:flutter/material.dart';
import 'package:geniego/bindings/general_bindings.dart';
import 'package:geniego/common/pages/not_found_page.dart';
import 'package:geniego/features/authentication/screens/login/login_screen.dart';
import 'package:geniego/features/authentication/screens/onboarding/on_boarding_screen.dart';
import 'package:geniego/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:geniego/features/authentication/screens/profile/profile.dart';
import 'package:geniego/features/authentication/screens/signup/signup_screen.dart';
import 'package:geniego/features/authentication/services/auth_middleware.dart';
import 'package:geniego/features/shop/screens/home/home_screen.dart';
import 'package:geniego/features/shop/screens/order/order.dart';
import 'package:geniego/navigation_menu.dart';
import 'package:geniego/utils/constants/pages.dart';
import 'package:geniego/utils/theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:geniego/utils/constants/text_strings.dart';
import 'package:geniego/utils/locale/locale.dart';
import 'package:geniego/utils/locale/locale_controller.dart';
import 'package:geniego/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppThemeController());
    Get.put(AppLocaleController());

    final keys = GetStorage().getKeys();
    final values = GetStorage().getValues();

    print(keys);
    print(values);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTexts.appName,
      themeMode: AppThemeController.instance.initialTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      locale: AppLocaleController.instance.initialLang,
      translations: AppLocale(),
      initialRoute: '/',
      unknownRoute: GetPage(name: notFound, page: () => NotFoundScreen()),
      getPages: [
        GetPage(
          name: onBoardingScreen,
          page: () => OnBoardingScreen(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(name: loginScreen, page: () => LoginScreen()),
        GetPage(name: signupScreen, page: () => SignupScreen()),
        GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
        GetPage(
          name: mainScreen,
          page: () => NavigationMenu(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(name: homeScreen, page: () => HomeScreen()),
        GetPage(name: profileScreen, page: () => ProfileScreen()),
        GetPage(name: ordersScreen, page: () => OrdersScreen()),
      ],
    );
  }
}
