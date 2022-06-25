import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  //////////////////////////////////////////////////////////////////////////////
  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesTokenKey = "TOKEN";
  //////////////////////////////////////////////////////////////////////////////

  //saving data to shared preference

  static Future<bool> saveUserLoggedInSharedPreference(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferencesUserLoggedInKey, isLoggedIn);
  }


  static Future<bool> saveTokenSharedPreference(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencesTokenKey, token);
  }



  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPreferencesUserLoggedInKey);
  }


  static Future<String?> getTokenSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencesTokenKey);
  }



}