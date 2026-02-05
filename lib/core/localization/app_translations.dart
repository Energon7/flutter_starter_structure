import 'package:get/get.dart';

import 'locale_keys.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          LocaleKeys.appTitle: 'Flutter Starter',
          LocaleKeys.splashTitle: 'Starting...',
          LocaleKeys.home: 'Home',
          LocaleKeys.search: 'Search',
          LocaleKeys.profile: 'Profile',
          LocaleKeys.unexpectedError: 'Unexpected error occurred.',
          LocaleKeys.tryAgain: 'Try again',
          LocaleKeys.loading: 'Loading',
        },
        'az_AZ': {
          LocaleKeys.appTitle: 'Flutter Starter',
          LocaleKeys.splashTitle: 'Yuklenir...',
          LocaleKeys.home: 'Ana sehife',
          LocaleKeys.search: 'Axtaris',
          LocaleKeys.profile: 'Profil',
          LocaleKeys.unexpectedError: 'Gozlenilmez xeta bas verdi.',
          LocaleKeys.tryAgain: 'Yeniden cehd et',
          LocaleKeys.loading: 'Yuklenir',
        },
      };
}
