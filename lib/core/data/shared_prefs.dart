import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> saveUserLoggedInSharedPref(bool isUserLoggedIn);

  Future<bool> saveUserJWTSharedPref(String userJWT);

  Future<bool?> getUserLoggedInSharedPref();

  Future<String?> getUserJWTSharedPref();
}

class SharedPrefs implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  SharedPrefs({required this.sharedPreferences});

  String sharedPrefUserLoggedInKey = "ISLOGGEDIN";
  String sharedPrefUserJWTKey = "USERJWTKEY";

  //TODO: catch all data from login api - @WNIA

  /*
   * Saving data retrieved from login api to shared preferences
   */
  @override
  Future<bool> saveUserLoggedInSharedPref(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPrefUserLoggedInKey, isUserLoggedIn);
  }

  @override
  Future<bool> saveUserJWTSharedPref(String userJWT) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefUserJWTKey, userJWT);
  }

  /*
   * Getting data from shared preferences
   */
  @override
  Future<bool?> getUserLoggedInSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPrefUserLoggedInKey);
  }

  @override
  Future<String?> getUserJWTSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPrefUserJWTKey);
  }
}
