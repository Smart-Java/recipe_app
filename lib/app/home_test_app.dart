import 'package:flutter/material.dart';
import 'package:home_test/config/appRouterHandler/app_router.dart';
import 'package:home_test/config/appTheme/app_theme.dart';

final _appRouter = AppRouter();

class HomeTestApp extends StatelessWidget {

  const HomeTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.day(),
      themeMode: ThemeMode.light,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate()
    );
  }
}
