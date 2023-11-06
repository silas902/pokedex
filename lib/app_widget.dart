
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Application Name',
      theme: ThemeData(),
      //darkTheme: CustomThemeExtension.lightTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}
