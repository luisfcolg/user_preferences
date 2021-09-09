import 'package:flutter/material.dart';

import 'package:user_preferences/screens/home_screen.dart';
import 'package:user_preferences/screens/settings_screen.dart';
import 'package:user_preferences/shared_prefs/user_preferences.dart';

class CustomDrawer extends StatelessWidget {
  final _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Container(
        color: _prefs.secondaryColor ? Colors.grey : Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/menu-img.jpg"),
                  fit: BoxFit.cover
                )
              ),
              child: Container(),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => ModalRoute.of(context)!.settings.name == HomeScreen.routeName ?
                Navigator.pop(context) :
                Navigator.pushReplacementNamed(context, HomeScreen.routeName)
            ),
            ListTile(
              leading: Icon(Icons.party_mode),
              title: Text("Party mode"),
              onTap: () {}
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("People"),
              onTap: () {}
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => ModalRoute.of(context)!.settings.name == SettingsScreen.routeName ?
                Navigator.pop(context) :
                Navigator.pushReplacementNamed(context, SettingsScreen.routeName)
            )
          ]
        )
      )
    );
  }
}
