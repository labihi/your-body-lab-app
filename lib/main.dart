import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:your_body_lab/app.dart';

Future main() async {
  // turn off the # in the URLs on the web
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  usePathUrlStrategy();
  runApp(const App());
}

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart

/// Widget for the root/initial pages in the bottom navigation bar.

/// The details screen for either the A or B screen.

