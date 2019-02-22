import 'package:flutter/material.dart';
import 'skip_down_time.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool _isToHome = false;
  int _count = 5;

  @override
  void initState() {
    super.initState();
    _delayToHomePage();
    // _doCountDown();
  }

  // void _doCountDown() {
  //   Timer(Duration(seconds: 1), () {
  //     debugPrint('111');
  //   });
  //   // startTimeout()
  // }

  void _toHome() {
    _isToHome = true;
    Navigator.of(context).pushReplacementNamed('/home');
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
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        '底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        '状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px

    print('实际宽度的dp与设计稿px的比例:${ScreenUtil().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}');

    print(
        '宽度和字体相对于设计稿放大的比例:${ScreenUtil().scaleWidth * ScreenUtil.pixelRatio}');
    print('高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight * ScreenUtil.pixelRatio}');
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

    return Stack(
      children: <Widget>[
        Image.asset(
          'images/splash.jpg',
          fit: BoxFit.fitHeight,
        ),
        Positioned(
          top: ScreenUtil().setSp(20),
          right: 0,
          child: GestureDetector(
            onTap: _toHome,
            child: Container(
              child: Text(
                '跳过',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(32), decorationStyle: TextDecorationStyle.dashed),
              ),
              alignment: Alignment(0, 0),
              margin: EdgeInsets.all(30.0),
              width: ScreenUtil().setHeight(88),
              height: ScreenUtil().setHeight(88),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(
                  color: Colors.orangeAccent,
                  width: ScreenUtil().setHeight(1),
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
