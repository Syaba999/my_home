import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = new FlutterSecureStorage();

  static const String _kPinKey = "PIN";

  Future<String> get pin async => await _storage.read(key: _kPinKey);
  Future<void> setPin(String pin) async =>
      await _storage.write(key: _kPinKey, value: pin);
  Future<void> deletePin() async => await _storage.delete(key: _kPinKey);
}
