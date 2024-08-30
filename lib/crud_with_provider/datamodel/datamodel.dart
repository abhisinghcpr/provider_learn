// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  String name;
  String address;
  String email;

  DataModel({
    required this.name,
    required this.address,
    required this.email,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    name: json["name"],
    address: json["address"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "email": email,
  };
}
