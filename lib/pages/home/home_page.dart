import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/pages/home/widgets/app_drawer.dart';

import 'mobx/home_store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<HomeStore>(
      store: HomeStore(),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, HomeStore store) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store.pageTitle),
      ),
      drawer: AppDrawer(
        drawerItems: store.drawerItems,
        selectPage: store.selectDrawer,
      ),
      body: store.page,
    );
  }
}
