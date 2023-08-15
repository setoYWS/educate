import 'dart:convert';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:educate/src/home/detail_class.dart';
import 'package:educate/src/home/edit_class.dart';
import 'package:educate/src/home/payload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'components/customAppBar.dart';
import 'config.dart';

class StatTeacher extends StatefulWidget {
  const StatTeacher({Key? key}) : super(key: key);

  @override
  _StatTeacherState createState() => _StatTeacherState();
}

class _StatTeacherState extends State<StatTeacher> {
  SharedPreferences? prefs;
  List? jsonResponse;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    getNewestCourse();
  }

  Future getNewestCourse() async {
    final myToken = prefs?.getString('token') ?? '{}';
    final jwt = JWT.decode(myToken);
    final decoded = Payload.fromJson(jwt.payload);
    final headers = {
      "instid": decoded.id ?? '',
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(Uri.parse(courseNewest), headers: headers);
    this.setState(() {
      jsonResponse = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          'Educate',
          lead: false,
          people: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome to Educate",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 68, 66, 66),
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Your Popular Course",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 85,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 85,
                        child: Row(children: [
                          Container(
                            width: 65,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 171, 17, 218)),
                            child: Center(
                              child: Text(
                                "BC",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Basic Class",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "20 Participants",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ]),
                      ),
                      SizedBox(
                        width: 200,
                        height: 85,
                        child: Row(children: [
                          Container(
                            width: 65,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 171, 17, 218)),
                            child: Center(
                              child: Text(
                                "AC",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Advanced Class",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "15 Participants",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      SizedBox(
                        width: 200,
                        height: 85,
                        child: Row(children: [
                          Container(
                            width: 65,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 171, 17, 218)),
                            child: Center(
                              child: Text(
                                "IC",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Intermediate Class",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "10 Participants",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ))
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your Recent Course",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: jsonResponse == null ? 0 : jsonResponse?.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                                        image: NetworkImage(url +
                                            jsonResponse?[index]["image"]),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        jsonResponse?[index]["description"],
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          TextButton(
                                            child: const Text('Edit'),
                                            onPressed: () => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditClass(
                                                            courseid:
                                                                jsonResponse?[
                                                                        index]
                                                                    ["_id"],
                                                          )))
                                            },
                                          ),
                                          const SizedBox(width: 8),
                                          TextButton(
                                            child: const Text('Open'),
                                            onPressed: () => {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailClass(
                                                            courseid:
                                                                jsonResponse?[
                                                                        index]
                                                                    ["_id"],
                                                          )))
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
                    })
              ],
            ),
          ),
        ));
  }
}
