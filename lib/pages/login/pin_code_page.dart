import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

import 'mobx/pin_store.dart';
import 'widgets/pin_keyboard.dart';
import 'widgets/pin_num_container.dart';

class PinCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MobxStatelessObserver<PinStore>(
      store: PinStore(),
      builder: _content,
    ));
  }

  Widget _content(BuildContext context, PinStore store) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !store.isError
                      ? Text(store.pinEntered == null
                          ? "Задайте код"
                          : "Повторите код")
                      : Text(
                          "Введенные коды не совпадают",
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: store.pin
                        .map((code) => PinNumContainer(
                              code: code,
                              isError: store.isError,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PinKeyboard(
                onButtonPress: store.onPinEnter,
                removeButtonPress: store.removePinNum,
                backButtonPress: store.backButtonPressed,
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        if (store.isLoading)
          Container(
            color: Colors.black12,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
