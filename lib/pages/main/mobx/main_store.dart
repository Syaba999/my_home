import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/models/debtor.dart';
import 'package:my_home/models/meeting.dart';
import 'package:my_home/models/news.dart';
import 'package:my_home/models/poll.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore extends MobxBase with Store {
  final String totalArea = "1 000";
  final String commonArea = "100";
  final int ownerCount = 20;

  final String balance = "1 000 000";
  final String income = "200 000";
  final String consumption = "500 000";

  final List<Debtor> debtors = [
    Debtor("10", "100 000"),
    Debtor("23", "79 000"),
    Debtor("48", "123 000"),
  ];

  final List<Meeting> activeMeetings = [
    Meeting(
        "Собрание участников товарищества, очно-заочное, годовое очередное", [
      Agenda("1. О выборе Председателя и Секретаря собрания"),
      Agenda("2. О выборе счетной комиссии собрания"),
      Agenda("3. О выборе новых членов Правления/Совета дома"),
    ]),
    Meeting(
        "Собрание участников товарищества, очно-заочное, годовое очередное", [
      Agenda("1. О выборе Председателя и Секретаря собрания"),
      Agenda("2. О выборе счетной комиссии собрания"),
      Agenda("3. О выборе новых членов Правления/Совета дома"),
    ]),
    Meeting(
        "Собрание участников товарищества, очно-заочное, годовое очередное", [
      Agenda("1. О выборе Председателя и Секретаря собрания"),
      Agenda("2. О выборе счетной комиссии собрания"),
      Agenda("3. О выборе новых членов Правления/Совета дома"),
    ]),
  ];

  final List<Poll> polls = [
    Poll("Нужна ли велопарковка?"),
    Poll("Шлагбаум"),
    Poll("Установка видеонаблюдения"),
  ];

  final List<News> newsList = [
    News("Отключение воды", "22.08.2020", 'assets/images/news1.png'),
    News("Объявление о предстоящем ремонте", "22.08.2020",
        'assets/images/news2.jpg'),
    News("Отключение воды", "22.08.2020", 'assets/images/news3.jpg'),
  ];

  Future<void> fetchData() async {
    toLoadingState();
    await Future.delayed(Duration(seconds: 1));
    toSuccessState();
  }

  @override
  void dispose() {}
}
