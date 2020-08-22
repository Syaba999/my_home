import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/models/drawer_item.dart';
import 'package:my_home/pages/main/main_page.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore extends MobxBase with Store {
  @override
  void dispose() {}

  @observable
  int selectedDrawerItem = 0;

  @action
  void selectDrawer(int index) {
    selectedDrawerItem = index;
  }

  List<DrawerItem> drawerItems = [
    DrawerItem(title: "Мой дом", page: MainPage()),
    DrawerItem(title: "Коммунальные услуги", page: Container()),
    DrawerItem(title: "Собрания собственников", page: Container()),
    DrawerItem(title: "Опросы", page: Container()),
    DrawerItem(title: "Объявления", page: Container()),
    DrawerItem(title: "Чат", page: Container()),
  ];

  String get pageTitle => drawerItems[selectedDrawerItem].title;

  Widget get page => drawerItems[selectedDrawerItem].page;
}
