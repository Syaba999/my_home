import 'package:flutter/material.dart';

class EsiaButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EsiaButton({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      elevation: 8,
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(text: "Войти через "),
              TextSpan(
                  text: "ГОС",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              TextSpan(
                  text: "УСЛУГИ",
                  style: TextStyle(color: Theme.of(context).accentColor)),
            ]),
      ),
      onPressed: onPressed,
    );
  }
}
