import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._();

  factory SharedPreferencesService() => _instance;

  SharedPreferencesService._();
  static logUserIn() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> user = {"loggedIn": true};
    String encodedUserMap = json.encode(user);
    await prefs.setString("user", encodedUserMap);
  }

  static Future<bool> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String encodedMap = prefs.getString("user") ?? "{}";
    Map<String, dynamic> decodedUserMap = json.decode(encodedMap);

    return ((decodedUserMap.isNotEmpty ? decodedUserMap["loggedIn"] : false) ??
        false);
  }

  static logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
