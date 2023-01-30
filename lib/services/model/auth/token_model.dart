//! THIS FILE CONTAINS THE IMPLEMENTATION FOR USER TOKENS.
//! WITH THIS MODEL, USER TOKENS ARE ENCRYPTED AND SAVED FOR REFERENCING
//! WITH THESE TOKENS, A COUPLE OF USER DATA CAN BE ACCESSED IN THE BE.

//! TO GENERATE NEW HIVE ADAPTER, RUN THE BELOW COMMAND.
//! - flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
import 'package:hive/hive.dart';
part "token_model.g.dart";

@HiveType(typeId: 0)
class UserToken extends HiveObject {
  @HiveField(0)
  late String? token;

  //! CONSTRUCTOR
  UserToken({this.token});

  //! TO JSON
  Map<String, dynamic> toJSON() => {"Token": token};

  //! FROM JSON
  factory UserToken.fromJSON(Map<String, dynamic> json) =>
      UserToken(token: json["Token"] ?? "");
}
