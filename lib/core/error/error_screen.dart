import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization/locale_keys.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 16),
              Text(
                message ?? LocaleKeys.unexpectedError.tr,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
