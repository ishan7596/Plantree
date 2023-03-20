// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.fName,
     this.lName,
     this.gender,
     this.bDate,
    required this.mNo,
    required this.email,
  });

  String fName;
  String? lName;
  String? gender;
  String? bDate;
  String mNo;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    fName: json["fName"],
    lName: json["lName"] ?? "",
    gender: json["gender"] ?? "",
    bDate: json["bDate"] ?? "",
    mNo: json["mNo"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "fName": fName,
    "lName": lName ?? "",
    "gender": gender ?? "",
    "bDate": bDate?? "",
    "mNo": mNo,
    "email": email,
  };
}
