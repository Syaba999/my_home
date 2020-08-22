import 'package:flutter/material.dart';

import 'app.dart';
import 'services/injector_service.dart';

void main() {
  InjectorService.setupNavigator();
  runApp(MyApp());
}
