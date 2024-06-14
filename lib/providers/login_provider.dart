import 'package:flutter/material.dart';
import 'package:tufinance/models/user_model.dart';

class LoginProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  String get userName => _user?.name ?? 'No name';
  String get userEmail => _user?.email ?? 'No email';

  void setUserLogged(UserModel userModel) {
    _user = userModel;
    notifyListeners();
  }

  void removeUserLogged() {
    _user = null;
    notifyListeners();
  }
}
