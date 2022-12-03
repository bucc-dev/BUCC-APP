class Event {
  late String? title;
  late String? description;
  late String? priority;
  late String? startDate;
  late String? time;

  Event(
      {this.title, this.description, this.priority, this.startDate, this.time});

  //! CREATE A FROM MAP
  Map<String, dynamic> toJSON() => {
        "title": title,
        "description": description,
        "priority": priority,
        "startDate": startDate,
        "time": time
      };

  factory Event.fromJSON(Map<String, dynamic> json) => Event(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      priority: json["priority"] ?? false,
      time: json["time"] ?? "",
      startDate: json["startDate"] ?? "");
}
