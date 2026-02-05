import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/localization/locale_keys.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.search.tr,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
