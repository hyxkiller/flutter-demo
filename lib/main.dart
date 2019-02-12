import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'translations.dart';
import 'widgets/splash/SplashWIdget.dart';
import 'Home.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class CartItem{
  String name;
  bool checked;

  CartItem(this.name, this.checked);
}

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}
class ToggleItemStateAction {
  final CartItem item;

  ToggleItemStateAction(this.item);
}

List<CartItem> appReducers(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is ToggleItemStateAction) {
    return toggleItemState(items, action);
  } 
  return items;
}
List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}
List<CartItem> toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  return items.map((item) => item.name == action.item.name ?
    action.item : item).toList();
}

void main() => runApp(App());
// void main() {
//   final store = Store<List<CartItem>>(
//     appReducers,
//     initialState: new List()
//   );
//   runApp(App(store));
// }

class App extends StatelessWidget {
  // final Store<List<CartItem>> store;
  // App(this.store);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
      home: SplashWidget(),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => Home(),
      },
    );
    // return StoreProvider<List<CartItem>>(
    //   store: store,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       primarySwatch: Colors.deepPurple,
    //       highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
    //       splashColor: Colors.white70,
    //     ),
    //     home: SplashWidget(),
    //     routes: <String, WidgetBuilder>{
    //       'home': (BuildContext context) => Home(),
    //     },
    //   ),
    // );
  }
}
