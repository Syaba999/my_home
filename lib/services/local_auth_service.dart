import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final _auth = LocalAuthentication();

  bool isAuthenticated = false;

  Future<void> authenticate() async {
    try {
      isAuthenticated = await _auth.authenticateWithBiometrics(
          localizedReason: 'Отсканируйте отпечаток пальца',
          useErrorDialogs: true,
          stickyAuth: true,
          androidAuthStrings: AndroidAuthMessages(
              signInTitle: "Защита отпечатком",
              cancelButton: "Закрыть",
              fingerprintHint: ""));
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
