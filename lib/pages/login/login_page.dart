import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/widgets/esia_button.dart';

import 'mobx/login_store.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobxStatelessObserver<LoginStore>(
        store: LoginStore(),
        builder: _content,
      ),
    );
  }

  Widget _content(BuildContext context, LoginStore store) {
    if (store.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            Image.asset(
              'assets/images/logo_blue.png',
              height: 150,
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              elevation: 8,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  children: [
                    Text(
                      "Вход",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Логин", border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Пароль", border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              elevation: 8,
              color: Theme.of(context).accentColor,
              child: Text(
                "Войти",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: store.loginButtonPress,
            ),
            Center(
                child: EsiaButton(
              onPressed: store.esiaButtonPress,
            )),
            FlatButton(
              child: Text("Зарегистрироваться"),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
