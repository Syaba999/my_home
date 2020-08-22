import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/config/routes_val.dart';
import 'package:my_home/services/injector_service.dart';
import 'package:my_home/services/local_auth_service.dart';
import 'package:my_home/services/navigator_service.dart';

part 'pin_store.g.dart';

class PinStore = _PinStore with _$PinStore;

abstract class _PinStore extends MobxBase with Store {
  final _navigator =
      InjectorService.getInjector.get<NavigatorService>().navigator;

  @observable
  List<String> pin = List.generate(5, (index) => "");

  List<String> pinEntered;

  int pinIndex = -1;

  @action
  void onPinEnter(String value) {
    if (!isError) {
      if (pinIndex != pin.length - 1) {
        pinIndex++;
      }
      if (pinIndex < pin.length && pin[pinIndex] == "") {
        pin[pinIndex] = value;
        pin = List.from(pin);
      }
      if (pinIndex == pin.length - 1 &&
          pin[pinIndex] != "" &&
          pinEntered == null) {
        pinEntered = pin;
        pinIndex = -1;
        pin = List.generate(5, (index) => "");
      }
      if (pinIndex == pin.length - 1 &&
          pin[pinIndex] != "" &&
          pinEntered != null &&
          !listEquals(pinEntered, pin)) {
        _pinNotEquals();
      }
      if (pinIndex == pin.length - 1 &&
          pin[pinIndex] != "" &&
          pinEntered != null &&
          listEquals(pinEntered, pin)) {
        _pinEquals();
      }
    }
  }

  Future<void> _pinEquals() async {
    toLoadingState();
    //final secureStorage =
    //    InjectorService.getInjector.get<SecureStorageService>();
    //await secureStorage.setPin(pin.join());

    final authService = InjectorService.getInjector.get<LocalAuthService>();
    await authService.authenticate();

    if (authService.isAuthenticated) {
      _navigator.pushNamedAndRemoveUntil(
          homePageRoute, (Route<dynamic> route) => false);
    }
/*
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biome trics $e");
    }

    print("biometric is available: $canCheckBiometrics");

    if (canCheckBiometrics) {
      List<BiometricType> availableBiometrics;
      try {
        availableBiometrics = await auth.getAvailableBiometrics();
      } catch (e) {
        print("error enumerate biometrics $e");
      }

      print("following biometrics are available");
      if (availableBiometrics.isNotEmpty) {
        availableBiometrics.forEach((ab) {
          print("\ttech: $ab");
        });
      } else {
        print("no biometrics are available");
      }

      bool authenticated = false;
      try {
        authenticated = await auth.authenticateWithBiometrics(
            localizedReason: 'Отсканируйте отпечаток пальца',
            useErrorDialogs: true,
            stickyAuth: false,
            androidAuthStrings: AndroidAuthMessages(
                signInTitle: "Включить защиту отпечатком?"));
      } catch (e) {
        print("error using biometric auth: $e");
      }

      print("authenticated: $authenticated");
      if (authenticated) {
        _navigator.pushNamedAndRemoveUntil(
            homePageRoute, (Route<dynamic> route) => false);
      }
    } else {
      _navigator.pushNamedAndRemoveUntil(
          homePageRoute, (Route<dynamic> route) => false);
    }

 */

    toSuccessState();
  }

  Future<void> _pinNotEquals() async {
    toErrorState();
    await Future.delayed(Duration(seconds: 2));
    pinEntered = null;
    pinIndex = -1;
    pin = List.generate(5, (index) => "");
    toSuccessState();
  }

  @action
  void removePinNum() {
    if (!isError) {
      if (pinIndex >= 0 && pin[pinIndex] != "") {
        pin[pinIndex] = "";
        pin = List.from(pin);
      }
      if (pinIndex >= 0) {
        pinIndex--;
      }
    }
  }

  void backButtonPressed() {
    _navigator.pop();
  }

  @override
  void dispose() {}
}
