import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:user_preferences/screens/home_screen.dart';
import 'package:user_preferences/screens/settings_screen.dart';
import 'package:user_preferences/shared_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences().initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Preferences",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle.light
        ),
        brightness: Brightness.light
      ),
      initialRoute: _prefs.lastScreen,
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        SettingsScreen.routeName: (BuildContext context) => SettingsScreen()
      }
    );
  }
}
