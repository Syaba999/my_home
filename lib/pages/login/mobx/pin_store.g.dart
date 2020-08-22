// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PinStore on _PinStore, Store {
  final _$pinAtom = Atom(name: '_PinStore.pin');

  @override
  List<String> get pin {
    _$pinAtom.reportRead();
    return super.pin;
  }

  @override
  set pin(List<String> value) {
    _$pinAtom.reportWrite(value, super.pin, () {
      super.pin = value;
    });
  }

  final _$_PinStoreActionController = ActionController(name: '_PinStore');

  @override
  void onPinEnter(String value) {
    final _$actionInfo =
        _$_PinStoreActionController.startAction(name: '_PinStore.onPinEnter');
    try {
      return super.onPinEnter(value);
    } finally {
      _$_PinStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePinNum() {
    final _$actionInfo =
        _$_PinStoreActionController.startAction(name: '_PinStore.removePinNum');
    try {
      return super.removePinNum();
    } finally {
      _$_PinStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pin: ${pin}
    ''';
  }
}
