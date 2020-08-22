import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/pages/splash/mobx/splash_store.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobxStatefulObserver<SplashStore>(
        store: SplashStore(),
        initFunction: (store) => store.init(),
        builder: _content,
      ),
    );
  }

  Widget _content(BuildContext context, SplashStore store) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                        height: 200,
                        child: Image.asset('assets/images/logo_white.png')),
                  ),
                ],
              )),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Theme.of(context).accentColor,
            child: Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
