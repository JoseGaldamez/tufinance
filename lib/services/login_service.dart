import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tufinance/models/user_model.dart';

// login
Future<UserModel?> loginService(String email, String password) async {
  final username = email.split('@').first;

  var loginUrl =
      Uri.https('uth-chat-default-rtdb.firebaseio.com', 'users/$username.json');

  var response = await http.get(loginUrl);
  if (response.statusCode != 200) {
    return null;
  }

  final jsonUser = json.decode(response.body);

  if (jsonUser == null) {
    return null;
  }

  final user = UserModel.fromJson(jsonUser);

  if (user.email == email && user.password == password) {
    return userModelFromJson(response.body);
  }

  return null;
}

// register
Future<bool> registerService(UserModel user) async {
  final username = user.email.split('@').first;

  var registerUrl =
      Uri.https('uth-chat-default-rtdb.firebaseio.com', 'users/$username.json');

  var response = await http.get(registerUrl);

  // ignore: unnecessary_null_comparison
  if (response.body == null) {
    return false;
  }

  var responseRegister =
      await http.put(registerUrl, body: userModelToJson(user));

  if (responseRegister.statusCode == 200) {
    return true;
  }

  return false;
}
