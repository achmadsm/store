import 'package:flutter/foundation.dart';
import 'package:store/data/api/api_service.dart';
import 'package:store/data/db/auth_repository.dart';
import 'package:store/data/model/user.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  AuthProvider(this.apiService, this.authRepository);

  bool isLoggedIn = false;

  String message = '';

  User? logInResponse;

  Future login(String username, String password) async {
    try {
      message = '';
      logInResponse = null;
      isLoggedIn = true;
      notifyListeners();

      await authRepository.login();
      isLoggedIn = await authRepository.isLoggedIn();

      logInResponse = await apiService.login(username, password);

      String? token = logInResponse?.token;
      String? firstName = logInResponse?.firstName;
      String? lastName = logInResponse?.lastName;
      String? image = logInResponse?.image;

      await authRepository.setUser(token, firstName, lastName, image);

      message = 'Success';
      isLoggedIn = false;
      notifyListeners();
    } catch (e) {
      isLoggedIn = false;
      message = 'Invalid username or Password';
      notifyListeners();
    }
  }

  Future<bool> logout() async {
    final logout = await authRepository.logout();
    if (logout) {
      await authRepository.removeUser();
    }
    isLoggedIn = await authRepository.isLoggedIn();
    notifyListeners();
    return !isLoggedIn;
  }
}
