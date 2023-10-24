import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/data/model/user.dart';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com';

  Future<User> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Invalid username or Password');
    }
  }
}
