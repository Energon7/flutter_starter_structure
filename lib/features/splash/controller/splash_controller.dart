import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../model/splash_model.dart';

class SplashController extends GetxController {
  SplashController({SplashModel? model}) : _model = model ?? const SplashModel();

  final SplashModel _model;

  Future<void> start(BuildContext context) async {
    await Future.delayed(_model.delay);
    if (!context.mounted) {
      return;
    }
    context.go(AppRoutes.home);
  }
}
