import 'package:get_it/get_it.dart';
import 'package:my_home/services/secure_storage_service.dart';

import 'api_service.dart';
import 'local_auth_service.dart';
import 'navigator_service.dart';

abstract class InjectorService {
  static GetIt getInjector = GetIt.instance;

  static void setup() {
    getInjector.registerLazySingleton(() => SecureStorageService());
    getInjector.registerLazySingleton(() => LocalAuthService());
    getInjector.registerLazySingleton(() => ApiService.create());
  }

  static void setupNavigator() {
    getInjector.registerLazySingleton(() => NavigatorService());
  }
}
