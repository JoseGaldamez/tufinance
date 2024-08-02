import 'package:shared_preferences/shared_preferences.dart';
import 'package:tufinance/models/user_model.dart';

Future<UserModel?> getUserData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final bool? isLogged = prefs.getBool('isLogged');

  if (isLogged != null && isLogged) {
    final String? name = prefs.getString('name');
    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password');

    if (name != null && email != null && password != null) {
      return UserModel(
          name: name, email: email, password: password, moves: null);
    }
  }

  return null;
}

Future<void> setDarkMode(bool mode) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isDark', mode);
}

Future<bool> getDarkMode() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? isDark = prefs.getBool('isDark');

  if (isDark == null) {
    return false;
  } else {
    return isDark;
  }
}

Future<void> setUserData(UserModel user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool('isLogged', true);
  await prefs.setString('name', user.name);
  await prefs.setString('email', user.email);
  await prefs.setString('password', user.password);
}

Future<void> removeUserData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool('isLogged', false);
  await prefs.remove('name');
  await prefs.remove('email');
  await prefs.remove('password');
}
