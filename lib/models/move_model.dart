import 'dart:convert';

MoveModel moveModelFromJson(String str) => MoveModel.fromJson(json.decode(str));

String moveModelToJson(MoveModel data) => json.encode(data.toJson());

class MoveModel {
  String category;
  String type;
  String amount;

  MoveModel({
    required this.category,
    required this.amount,
    required this.type,
  });

  factory MoveModel.fromJson(Map<dynamic, dynamic> json) => MoveModel(
        category: json["category"],
        type: json["type"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
        "amount": amount,
      };
}
