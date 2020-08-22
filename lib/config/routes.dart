import 'package:flutter/material.dart';
import 'package:my_home/config/routes_val.dart';
import 'package:my_home/pages/home/home_page.dart';
import 'package:my_home/pages/login/login_page.dart';
import 'package:my_home/pages/login/pin_code_page.dart';

abstract class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pinPageRoute:
        return _buildRoute(PinCodePage());
      case homePageRoute:
        return _buildRoute(HomePage());
      case loginPageRoute:
        return _buildRoute(LoginPage());
      default:
        return null;
    }
  }

  static MaterialPageRoute _buildRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
