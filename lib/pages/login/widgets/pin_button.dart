import 'package:flutter/material.dart';

class PinButton extends StatelessWidget {
  final ValueChanged<String> onPinPress;
  final int number;

  PinButton({Key key, this.onPinPress, this.number}) : super(key: key);

  final double _buttonSize = 70;

  final List<String> numberText = [
    "+",
    "",
    "ABC",
    "DEF",
    "GHI",
    "JKL",
    "MNO",
    "PQRS",
    "TUV",
    "WXYZ"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => onPinPress(number.toString()),
        child: Container(
          width: _buttonSize,
          height: _buttonSize,
          child: Center(
            child: number != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        number.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        numberText[number],
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  )
                : Icon(Icons.backspace),
          ),
        ),
      ),
    );
  }
}
