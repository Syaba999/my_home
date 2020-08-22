import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/config/routes_val.dart';
import 'package:my_home/services/injector_service.dart';
import 'package:my_home/services/navigator_service.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore extends MobxBase with Store {
  Future<void> init() async {
    await Future.wait([Future.delayed(Duration(seconds: 2)), _loadApp()])
        .then((value) => _appLoaded());
  }

  Future<void> _loadApp() async {
    InjectorService.setup();
    await InjectorService.getInjector.allReady();
  }

  void _appLoaded() {
    final navigator =
        InjectorService.getInjector.get<NavigatorService>().navigator;
    navigator.popAndPushNamed(loginPageRoute);
  }

  @override
  void dispose() {}
}
