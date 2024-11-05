import 'package:flutter/material.dart';
import 'package:your_body_lab/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final scale = mediaQuery.textScaler.clamp(
          minScaleFactor: 0.8,
          maxScaleFactor: 1.1,
        );

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: scale,
          ),
          child: child!,
        );
      },
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
    );
  }
}
