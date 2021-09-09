import 'package:flutter/material.dart';

import 'package:user_preferences/shared_prefs/user_preferences.dart';
import 'package:user_preferences/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _prefs = UserPreferences();
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _prefs.lastScreen = SettingsScreen.routeName;
    _textController = TextEditingController(text: _prefs.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings")
      ),
      backgroundColor: _prefs.secondaryColor ? Colors.grey : Theme.of(context).scaffoldBackgroundColor,
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text("Settings", style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold))
          ),
          Divider(),
          SwitchListTile(
            value: _prefs.secondaryColor,
            title: Text("Secondary color"),
            onChanged: _setSecondaryColor
          ),
          RadioListTile(
            groupValue: _prefs.gender,
            value: 1,
            title: Text("Male"),
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            groupValue: _prefs.gender,
            value: 2,
            title: Text("Female"),
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Name",
                helperText: "User's name"
              ),
              onChanged: _setName
            )
          )
        ]
      )
    );
  }

  void _setSelectedRadio(int? value) => setState(() => _prefs.gender = value ?? 1);

  void _setSecondaryColor(bool value) => setState(() => _prefs.secondaryColor = value);

  void _setName(String value) {
    setState(() => _prefs.name = value);
  }
}
