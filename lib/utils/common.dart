import 'package:flutter/material.dart';
import 'package:demo1/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:demo1/redux/actions.dart';
import 'package:demo1/widgets/common/FlexButton.dart';

class CommonUtils {
  // 刘海控制
  static topPadding(context) {
    return EdgeInsets.only(top: MediaQuery.of(context).padding.top)
  }
  // 改变语言
  static changeLocale(Store<HYXState> store, int index) {
    Locale locale = store.state.locale;
    switch (index) {
      case 0:
        locale = Locale('zh', 'CN');
        break;
      case 1:
        locale = Locale('en', 'US');
        break;
    }
    store.dispatch(RefreshLocaleAction(locale));
  }

  // 显示切换语言选择框
  static Future<Null> showCommitLangDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {
    width = 250.0,
    height = 400.0,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: new Container(
              width: width,
              height: height,
              padding: new EdgeInsets.all(4.0),
              margin: new EdgeInsets.all(20.0),
              child: new ListView.builder(
                  itemCount: commitMaps.length,
                  itemBuilder: (context, index) {
                    return FlexButton(
                      maxLines: 2,
                      mainAxisAlignment: MainAxisAlignment.start,
                      fontSize: 14.0,
                      text: commitMaps[index],
                      onPress: () {
                        onTap(index);
                        Navigator.pop(context);
                      },
                    );
                  }),
            ),
          );
        });
  }
}
