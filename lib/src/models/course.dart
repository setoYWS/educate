import 'package:flutter/material.dart';

class courselist {
  String? id, instructorid, coursename, level, description, image;
  courselist(
      {this.id,
      this.instructorid,
      this.coursename,
      this.level,
      this.description,
      this.image});

  factory courselist.fromJson(Map<String, dynamic> json) {
    return courselist(
        id: json['_id'],
        instructorid: json['instructorid'],
        coursename: json['coursename'],
        level: json['level'],
        description: json['description'],
        image: json['image']);
  }
}
