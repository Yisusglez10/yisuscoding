import 'dart:convert';
import 'package:flutter/material.dart';

List<Tarea> getFromJson(String str) => List<Tarea>.from(json.decode(str).map((x) => Tarea.fromJson(x)));

String getToJson(List<Tarea> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//agregué extendes change
class Tarea with ChangeNotifier {
    Tarea({
        required this.id,
        required this.title,
        required this.isCompleted,
        required this.dueDate,
    });

    int id;
    String title;
    int isCompleted;
    DateTime dueDate;

    factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"],
        dueDate: DateTime.parse(json["due_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
    };

    //No funciona aún....
    @override
    notifyListeners();
}

