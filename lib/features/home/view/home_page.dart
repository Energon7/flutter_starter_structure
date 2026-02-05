import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/locale_keys.dart';
import '../controller/home_controller.dart';
import '../model/home_tab.dart';
import 'pages/feed_page.dart';
import 'pages/profile_page.dart';
import 'pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final List<HomeTab> tabs = [
      HomeTab(
        labelKey: LocaleKeys.home,
        icon: const Icon(Icons.home_outlined),
        activeIcon: const Icon(Icons.home),
        page: const FeedPage(),
      ),
      HomeTab(
        labelKey: LocaleKeys.search,
        icon: const Icon(Icons.search_outlined),
        activeIcon: const Icon(Icons.search),
        page: const SearchPage(),
      ),
      HomeTab(
        labelKey: LocaleKeys.profile,
        icon: const Icon(Icons.person_outline),
        activeIcon: const Icon(Icons.person),
        page: const ProfilePage(),
      ),
    ];

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: tabs.map((tab) => tab.page).toList(),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.setIndex,
          items: tabs
              .map(
                (tab) => BottomNavigationBarItem(
                  icon: tab.icon,
                  activeIcon: tab.activeIcon,
                  label: tab.labelKey.tr,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
