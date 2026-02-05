import 'package:flutter/material.dart';

class HomeTab {
  const HomeTab({
    required this.labelKey,
    required this.icon,
    required this.activeIcon,
    required this.page,
  });

  final String labelKey;
  final Icon icon;
  final Icon activeIcon;
  final Widget page;
}
