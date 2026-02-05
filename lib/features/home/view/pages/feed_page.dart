import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/localization/locale_keys.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.home.tr,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
