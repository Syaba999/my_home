import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:my_home/pages/main/mobx/main_store.dart';
import 'package:my_home/widgets/loading.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulObserver<MainStore>(
      store: MainStore(),
      initFunction: (store) => store.fetchData(),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, MainStore store) {
    if (store.isLoading) {
      return Loading();
    }
    return RefreshIndicator(
      onRefresh: store.fetchData,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Material(
              elevation: 8,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.blue[800],
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Тверская, 11",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildHouseInfo(context, "${store.totalArea}м",
                                  "Общая площадь"),
                              _buildHouseInfo(context, "${store.commonArea}м",
                                  "Площадь общего имущества"),
                              _buildHouseInfo(context, "${store.ownerCount}",
                                  "Собственников"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildBudgetInfo(
                              context, "Баланс", "${store.balance}р"),
                          VerticalDivider(),
                          _buildBudgetInfo(
                              context, "Доходы", "${store.income}р"),
                          VerticalDivider(),
                          _buildBudgetInfo(
                              context, "Расходы", "${store.consumption}р"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              elevation: 8,
              color: Theme.of(context).accentColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Список должников",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  for (var debtor in store.debtors)
                    _buildDebtorRow(context, debtor.flat, debtor.sum),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Текущие собрания",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 140,
              child: ListView.builder(
                  itemCount: store.activeMeetings.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                        width: 200,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  store.activeMeetings[index].title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Divider(),
                                Text(
                                  store.activeMeetings[index].agendasInline,
                                  maxLines: 4,
                                  overflow: TextOverflow.fade,
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Текущие опросы",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 140,
              child: ListView.builder(
                  itemCount: store.polls.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                        width: 200,
                        child: Card(
                          color: Theme.of(context).primaryColor,
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                store.polls[index].title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Последние новости",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 140,
              child: ListView.builder(
                  itemCount: store.activeMeetings.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(8),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    Image.asset(
                                      store.newsList[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: double.maxFinite,
                                        color: Colors.black38,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: Text(
                                            store.newsList[index].title,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDebtorRow(BuildContext context, String flat, String sum) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "кв. $flat",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "$sumр",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _buildBudgetInfo(BuildContext context, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildHouseInfo(BuildContext context, String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
