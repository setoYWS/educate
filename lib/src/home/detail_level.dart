import 'dart:convert';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:educate/src/home/addCourse.dart';
import 'package:educate/src/home/config.dart';
import 'package:educate/src/home/detail_class.dart';
import 'package:educate/src/home/edit_class.dart';
import 'package:educate/src/home/payload.dart';
import 'package:educate/src/models/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'components/customAppBar.dart';

class detail_level extends StatefulWidget {
  String level;
  detail_level({Key? key, required this.level}) : super(key: key);

  @override
  _detail_levelState createState() => _detail_levelState();
}

class _detail_levelState extends State<detail_level> {
  SharedPreferences? prefs;
  List? jsonResponse;
  List<courselist>? courseResponse;
  String? image;

  @override
  void initState() {
    super.initState();
    getCoursebyLevel();
  }

  Future getCoursebyLevel() async {
    final headers = {
      "level": widget.level,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(Uri.parse(level), headers: headers);
    this.setState(() {
      jsonResponse = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        'Class List',
        lead: false,
        people: false,
      ),
      body: SingleChildScrollView(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: jsonResponse == null ? 0 : jsonResponse?.length,
              itemBuilder: (BuildContext context, int index) {
                if ("courseResponse?.coursename" == "") {
                  image =
                      "https://pluspng.com/img-png/flower-hd-png-abstract-flower-picture-png-image-1271.png";
                } else {
                  image = url + jsonResponse?[index]["image"];
                }
                return Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 35,
                          left: 20,
                          child: Material(
                            child: Container(
                              height: 188.0,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: Offset(-10.0, 10.0),
                                      blurRadius: 20.0,
                                      spreadRadius: 4.0),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        top: 15,
                        left: 30,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 190,
                            width: 125,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(image ?? ""),
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 60,
                          left: 180,
                          child: Container(
                            height: 150,
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  jsonResponse?[index]["coursename"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF363f93),
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(color: Colors.black),
                                Text(
                                  jsonResponse?[index]['description'],
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    const SizedBox(width: 8),
                                    TextButton(
                                      child: const Text('Open'),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailClass(
                                                      courseid:
                                                          jsonResponse?[index]
                                                              ["_id"],
                                                    )));
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              })),
    );
  }
}
