import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_strings.dart';
import '../core/localization/app_locales.dart';
import '../core/localization/app_translations.dart';
import '../core/theme/app_theme.dart';
import '../di/service_locator.dart';
import '../routing/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = getIt<AppRouter>().router;

    return GetMaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: AppLocales.enUS,
      supportedLocales: AppLocales.supported,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
