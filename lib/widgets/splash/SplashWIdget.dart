import 'package:flutter/material.dart';
import 'skip_down_time.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool _isToHome = false;
  int second = 5;

  @override
  void initState() {
    super.initState();
    _delayToHomePage();
    // _countDown();
  }

  // void _countDown() {
  //   Timer(Duration(seconds: 1), () {
  //     debugPrint('111');
  //   });
  //   // startTimeout()
  // }

  void _toHome() {
    _isToHome = true;
    Navigator.pushNamed(context, 'home');
  }

  _delayToHomePage() {
    Future.delayed(Duration(seconds: 5), () {
      if (!this._isToHome) {
        _toHome();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/splash.jpg',
          fit: BoxFit.fitHeight,
        ),
        Positioned(
          top: 20.0,
          right: 0,
          child: GestureDetector(
            onTap: _toHome,
            child: Container(
              child: Text(
                '跳过',
                style: TextStyle(
                    fontSize: 16, decorationStyle: TextDecorationStyle.dashed),
              ),
              alignment: Alignment(0, 0),
              margin: EdgeInsets.all(30.0),
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(
                  color: Colors.orangeAccent,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
