import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  String note;
  DateTime startDateTime;
  DateTime endDateTime;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String location;
  ColorSwatch color;

  Task({
    this.id,
    this.title,
    this.note,
    this.startDateTime,
    this.endDateTime,
    this.startTime,
    this.endTime,
    this.location,
    this.color,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: json["id"],
      title: json["title"],
      note: json["note"],
      startDateTime: json["startDate"],
      endDateTime: json["endDateTime"],
      location: json["location"],
      color: json["color"],
      startTime: json["startTime"],
      endTime: json["endTime"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "note": note,
        "startDateTime": startDateTime,
        "endDateTime": endDateTime,
        "startTime": startTime,
        "endTime": endTime,
        "location": location,
        "color": color
      };
}
