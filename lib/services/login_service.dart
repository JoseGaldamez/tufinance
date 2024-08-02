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

  // TODO: user https://pub.dev/packages/crypto to encript Password
  if (user.email == email && user.password == password) {
    return userModelFromJson(response.body);
  }

  return null;
}

Future<UserModel?> getUserService(String email) async {
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

  return user;
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

Future<int> updatePassword(
    String currentPass, String newPassword, String email) async {
  final username = email.split('@').first;

  var userUrl =
      Uri.https('uth-chat-default-rtdb.firebaseio.com', 'users/$username.json');

  var response = await http.get(userUrl);

  // ignore: unnecessary_null_comparison
  if (response.body == null) {
    return 0;
  }
  final jsonUser = json.decode(response.body);

  final String onlinePass = jsonUser['password'].toString();

  if (onlinePass != currentPass.toString()) {
    return 2;
  }

  var updatePasswordURL = Uri.https(
      'uth-chat-default-rtdb.firebaseio.com', 'users/$username/password.json');

  var responseRegister =
      await http.put(updatePasswordURL, body: json.encode(newPassword));

  if (responseRegister.statusCode == 200) {
    return 1;
  } else {
    return 3;
  }
}
