// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
import './Listview.dart';
void main() => runApp(MyApp(
  items: new List<String>.generate(1000, (i) => "item $i")
));

class MyApp extends StatelessWidget {

  final List<String> items;
  MyApp({Key key, @required this.items}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
        // body: Center(
          // child: Text(
          //   'The world of cryptocurrency is in need of professional-grade charting and trading solutions. ChartIQ’s HTML5 Charting Library offers a powerful charting engine that can handle heavy loads of cryptocurrency data, all within an easily customizable user interface. ChartIQ’s crypto solution can be completely white labeled across multiple domains and offers US-based support.',
          //   textAlign: TextAlign.left,
          //   // maxLines: 3,
          //   // overflow: TextOverflow.ellipsis,
          //   style: TextStyle(
          //     fontSize: 24,
          //     color: Color.fromARGB(255, 255, 150, 150),
          //     decorationStyle: TextDecorationStyle.dashed,
          //   ),
          // ),
          // child: Container(
          //   child: new Text(
          //     'hello flutter',
          //     style: TextStyle(
          //       fontSize: 20,
          //     ),
          //   ),
          //   width: 500,
          //   height: 300,
          //   padding: EdgeInsets.all(20),
          //   margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
          //   decoration: new BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Colors.lightBlue,
          //         Colors.purple,
          //         Colors.greenAccent
          //       ]
          //     )
          //   ),
          //   alignment: Alignment.centerLeft,
          //   // color: Colors.blue,
          // ),
          // child: Container(
          //   child: Image.network(
          //     'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3387778552,1927665610&fm=173&app=49&f=JPEG?w=218&h=146&s=77649D44C8B8A98629269CCB0300C09A',
          //     // scale: 2,
          //     // fit: BoxFit.contain,
          //     // colorBlendMode: BlendMode.difference,
          //     repeat: ImageRepeat.repeatY,
          //   ),
          //   width: 400,
          //   height: 300,
          //   color: Colors.lightBlue,
          // ),
        // ),
        // body: new ListView(
        //   children: <Widget>[
        //     new ListTile(
        //       leading: new Icon(Icons.accessible_forward),
        //       title: new Text('data'),
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.satellite),
        //       title: new Text('ios'),
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.question_answer),
        //       title: new Text('qqq'),
        //     ),
        //     new Image.network('https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3387778552,1927665610&fm=173&app=49&f=JPEG?w=218&h=146&s=77649D44C8B8A98629269CCB0300C09A'),
        //     new Image.network('https://b-gold-cdn.xitu.io/v3/static/img/flutter.851314d.png'),
        //     new Image.network('https://user-gold-cdn.xitu.io/2018/12/25/167e14942f2dcf44?w=1950&h=2730&f=png&s=1007819'),
        //   ],
        // ),
        // body: Center(
        //   child: Container(
        //     height: 200,
        //     child: Listview(),
        //   ),
        // ),
      ),
    );
  }
}