import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/localization/locale_keys.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.profile.tr,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
