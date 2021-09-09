import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  /*
  bool? secondaryColor;
  int? gender;
  String? name;
  */

  static final UserPreferences _instance = UserPreferences._();

  late SharedPreferences _prefs;

  UserPreferences._();

  factory UserPreferences() {
    return _instance;
  }

  initPrefs () async => _prefs = await SharedPreferences.getInstance();

  bool get secondaryColor => _prefs.getBool("secondaryColor") ?? false;
  set secondaryColor(bool value) => _prefs.setBool("secondaryColor", value);

  int get gender => _prefs.getInt("gender") ?? 1;
  set gender(int value) => _prefs.setInt("gender", value);

  String get name => _prefs.getString("name") ?? "";
  set name(String value) => _prefs.setString("name", value);

  String get lastScreen => _prefs.getString("lastScreen") ?? "home";
  set lastScreen(String value) => _prefs.setString("lastScreen", value);
}