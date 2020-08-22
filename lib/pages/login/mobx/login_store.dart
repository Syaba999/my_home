import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/config/routes_val.dart';
import 'package:my_home/services/injector_service.dart';
import 'package:my_home/services/navigator_service.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;

  void loginButtonPress() async {
    toLoadingState();
    await Future.delayed(Duration(seconds: 1));
    await _navigator.pushNamed(pinPageRoute);
    toSuccessState();
  }

  void esiaButtonPress() async {
    toLoadingState();
    await Future.delayed(Duration(seconds: 1));
    await _navigator.pushNamed(pinPageRoute);
    toSuccessState();
  }

  @override
  void dispose() {}
}
