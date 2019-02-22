import 'package:flutter/material.dart';
import 'widgets/splash/SplashWidget.dart';
import 'Home.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(App());

class App extends StatelessWidget {
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
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}
