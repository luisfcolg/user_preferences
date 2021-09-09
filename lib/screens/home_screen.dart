import 'package:flutter/material.dart';

import 'package:user_preferences/shared_prefs/user_preferences.dart';
import 'package:user_preferences/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = "home";

  final _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    _prefs.lastScreen = routeName;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("User Preferences")
      ),
      backgroundColor: _prefs.secondaryColor ? Colors.grey : Theme.of(context).scaffoldBackgroundColor,
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Secondary color: ${_prefs.secondaryColor}"),
          Divider(),
          Text("Gender: ${_prefs.gender}"),
          Divider(),
          Text("Username: ${_prefs.name}"),
          Divider()
        ]
      )
    );
  }
}