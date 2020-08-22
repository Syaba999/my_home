import 'package:flutter/material.dart';

import 'pin_button.dart';

class PinKeyboard extends StatelessWidget {
  final ValueChanged<String> onButtonPress;
  final VoidCallback removeButtonPress;
  final VoidCallback backButtonPress;

  const PinKeyboard(
      {Key key,
      this.onButtonPress,
      this.removeButtonPress,
      this.backButtonPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                3,
                (index) => PinButton(
                      number: index + 1,
                      onPinPress: onButtonPress,
                    )).toList()),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                3,
                (index) => PinButton(
                      number: index + 4,
                      onPinPress: onButtonPress,
                    )).toList()),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                3,
                (index) => PinButton(
                      number: index + 7,
                      onPinPress: onButtonPress,
                    )).toList()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 70,
              height: 70,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: backButtonPress,
              ),
            ),
            PinButton(
              number: 0,
              onPinPress: onButtonPress,
            ),
            PinButton(
              onPinPress: (_) => removeButtonPress(),
            ),
          ],
        ),
      ],
    );
  }
}
