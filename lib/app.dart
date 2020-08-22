import 'package:flutter/material.dart';
import 'package:my_home/config/theme.dart';
import 'package:my_home/pages/home/home_page.dart';

import 'config/routes.dart';
import 'services/injector_service.dart';
import 'services/navigator_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      //home: SplashPage(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      navigatorKey:
          InjectorService.getInjector.get<NavigatorService>().navigatorKey,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
