//! THIS FILE HANDLES THE USER MODEL IN IT"S FULL GLORY - LOL.
//! TO GENERATE NEW HIVE ADAPTER, RUN THE BELOW COMMAND.
//! - flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

import 'package:hive_flutter/hive_flutter.dart';
part "user_model.g.dart";

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  //! DEFINITIONS

  @HiveField(0)
  late String? matricNumber;
  @HiveField(1)
  late String? phoneNumber;
  @HiveField(2)
  late String? email;
  @HiveField(3)
  late String? fullName;
  @HiveField(4)
  late String? profilePhoto;
  @HiveField(5)
  late String? department;
  @HiveField(6)
  late String? level;
  @HiveField(7)
  late String? group;

  //! CONSTRUCTOR
  UserModel(
      {this.matricNumber,
      this.phoneNumber,
      this.email,
      this.fullName,
      this.profilePhoto,
      this.department,
      this.level,
      this.group});

  //! TO JSON
  Map<String, dynamic> toJSON() => {
        "matric": matricNumber,
        "phonenumber": phoneNumber,
        "email": email,
        "fullName": fullName,
        "profile_pic": profilePhoto,
        "department": department,
        "level": level,
        "group": group
      };

  //! FROM JSON
  factory UserModel.fromJSON(Map<String, dynamic> json) => UserModel(
      matricNumber: json["matric"] ?? "",
      phoneNumber: json["phonenumber"] ?? "",
      email: json["email"] ?? "",
      fullName: json["fullName"] ?? "",
      profilePhoto:
          json["profile_pic"] != null ? json["profile_pic"]["url"] ?? "" : "",
      department: json["department"] ?? "",
      level: json["level"] ?? "",
      group: json["group"] ?? "");
}
