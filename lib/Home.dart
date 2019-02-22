import 'package:flutter/material.dart';
import 'widgets/quotes/index.dart';
import 'widgets/quotes/UsdtWidget.dart';
import 'widgets/quotes/SearchWidget.dart';
import 'widgets/wallets/WalletWidget.dart';
import 'widgets/exchange/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:demo1/locales/localizationDelegate.dart';
import 'widgets/LocalizationsWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:demo1/redux/store.dart';
import 'package:demo1/widgets/mine/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final List _body = [
    QuotesIndexWidget(),
    ExchangeWidget(),
    WalletWidget(),
    MineWidget(),
  ];

  final store = Store<HYXState>(appReducer,
      initialState: HYXState(
        // themeData:
        locale: Locale('zh', 'CN'),
      ));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // 命名路由，无法动态传参
        routes: <String, WidgetBuilder>{
          '/search': (BuildContext context) => SearchWidget(),
        },
        localizationsDelegates: [
          DemoLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [store.state.locale],
        locale: store.state.locale,
        home: LocalizationsWidget(
            child: Scaffold(
          body: _body[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: changeIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.assessment), title: Text('行情')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.swap_vertical_circle), title: Text('交易')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.work), title: Text('钱包')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), title: Text('我的')),
            ],
          ),
        )),
      ),
    );
  }
}
