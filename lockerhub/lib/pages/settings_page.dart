import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Notifications'),
            subtitle: Text(isNotificationEnabled ? 'Enabled' : 'Disabled'),
            trailing: CupertinoSwitch(
              value: isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationEnabled = value;
                });
                // You can also handle notification settings here.
              },
            ),
          ),
        ],
      ),
    );
  }
}
