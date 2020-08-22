import 'package:flutter/material.dart';

class PinNumContainer extends StatelessWidget {
  final String code;
  final bool isError;

  const PinNumContainer({Key key, this.code, this.isError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 30,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color:
                    isError ? Theme.of(context).errorColor : Colors.grey[300])),
        child: Center(
          child: code != ""
              ? Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      color: isError
                          ? Theme.of(context).errorColor
                          : Colors.black54,
                      borderRadius: BorderRadius.circular(10)),
                )
              : Container(),
        ),
      ),
    );
  }
}
