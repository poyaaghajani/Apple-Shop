import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  AuthManager._();

  static final sharedPref = locator.get<SharedPreferences>();
  static final ValueNotifier<String?> authNotifire = ValueNotifier(null);

  // save token
  static void saveToken(String token) {
    sharedPref.setString('access_token', token);
    authNotifire.value = token;
  }

  // read token
  static String readToken() {
    debugPrint('userToken --> ${sharedPref.getString('access_token')}');
    return sharedPref.getString('access_token') ?? '';
  }

  // save username
  static void saveUsername(String username) {
    sharedPref.setString('username', username);
    authNotifire.value = username;
  }

  // read username
  static String readUsername() {
    debugPrint('username --> ${sharedPref.getString('username')}');
    return sharedPref.getString('username') ?? '';
  }

  // save userId
  static void saveUserId(String userId) {
    sharedPref.setString('userId', userId);
    authNotifire.value = userId;
  }

  // read userId
  static String readUserId() {
    debugPrint('userId --> ${sharedPref.getString('userId')}');
    return sharedPref.getString('userId') ?? '';
  }

  // logOut
  static void logOut() {
    sharedPref.clear();
    authNotifire.value = null;
  }
}
