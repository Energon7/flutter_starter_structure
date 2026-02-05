import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'error_screen.dart';

class AppErrorHandler {
  static void init() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      ErrorReporter.record(details.exception, details.stack);
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      ErrorReporter.record(error, stack);
      return true;
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return ErrorScreen(message: details.exceptionAsString());
    };
  }
}

class ErrorReporter {
  static void record(Object error, StackTrace? stackTrace) {
    log('Unhandled error', error: error, stackTrace: stackTrace);
  }
}
