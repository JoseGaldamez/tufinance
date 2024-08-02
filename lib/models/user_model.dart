import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String password;
  String email;
  dynamic moves;

  UserModel({
    required this.name,
    required this.password,
    required this.email,
    required this.moves,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
      name: json["name"],
      password: json["password"],
      email: json["email"],
      moves: json["moves"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
        "moves": moves.toJson(),
      };
}
