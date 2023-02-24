//! THIS FILE HANDLES THE EVENT / POST MODEL.
//! TO GENERATE NEW HIVE ADAPTER, RUN THE BELOW COMMAND.
//! - flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

import 'package:hive_flutter/hive_flutter.dart';
part "event_model.g.dart";

@HiveType(typeId: 2)
class EventModel extends HiveObject {
  late String? postID;
  late String? title;
  late String? description;
  late String? priority;
  late String? startDate;
  late String? endDate;
  late String? time;

  EventModel(
      {this.postID,
      this.title,
      this.description,
      this.priority,
      this.startDate,
      this.endDate,
      this.time});

  //! CREATE A FROM MAP
  Map<String, dynamic> toJSON() => {
        "postID": postID,
        "title": title,
        "description": description,
        "priority": priority,
        "startDate": startDate,
        "endDate": endDate,
        "time": time
      };

  factory EventModel.fromJSON(Map<String, dynamic> json) => EventModel(
      postID: json["postID"],
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      priority: json["priority"] ?? false,
      time: json["time"] ?? "",
      startDate: json["startDate"] ?? "",
      endDate: json["endDate"] ?? "");
}
