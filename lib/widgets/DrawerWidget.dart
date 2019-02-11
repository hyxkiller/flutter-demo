import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          DrawerHeader(
            child: Text('drawer'),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
          ),
          ListTile(
            title: Text('listtile1', textAlign: TextAlign.right),
            trailing: Icon(Icons.message, size: 22.0, color: Colors.black12),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('listtile1', textAlign: TextAlign.right),
            trailing: Icon(Icons.healing, size: 22.0, color: Colors.black12),
          ),
        ],
      ),
    );
  }
}
