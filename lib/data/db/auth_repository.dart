import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final String stateKey = 'state';
  final String userKey = 'token';
  final String userFirstName = 'firstName';
  final String userLastName = 'lastName';
  final String profilePicture = 'image';

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(stateKey) ?? false;
  }

  Future<bool> login() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(stateKey, true);
  }

  Future<bool> logout() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(stateKey, false);
  }

  Future<void> setUser(token, fistName, lastName, image) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(userKey, token);
    preferences.setString(userFirstName, fistName);
    preferences.setString(userLastName, lastName);
    preferences.setString(profilePicture, image);
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(userKey);
  }

  Future<String?> getFirstName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(userFirstName);
  }

  Future<String?> getLastName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(userLastName);
  }

  Future<String?> getImage() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(profilePicture);
  }

  Future<void> removeUser() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.remove(userKey);
    preferences.remove(userFirstName);
    preferences.remove(userLastName);
    preferences.remove(profilePicture);
  }
}
