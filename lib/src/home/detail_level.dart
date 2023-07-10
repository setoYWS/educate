import 'dart:convert';
import 'dart:io';

import 'package:educate/src/data/advanced_tile.dart';
import 'package:educate/src/data/materi.dart';
import 'package:educate/src/home/config.dart';
import 'package:educate/src/home/materi.dart';
import 'package:educate/src/models/advanced_tile.dart';
import 'package:educate/src/models/materi.dart';
import 'package:educate/src/models/utils.dart';
import 'package:educate/main.dart';
import 'package:flutter/material.dart';
import 'package:educate/src/home/quiz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdvancedTilePage extends StatefulWidget {
  @override
  _AdvancedTilePageState createState() => _AdvancedTilePageState();
}

class _AdvancedTilePageState extends State<AdvancedTilePage> {
  List? jsonResponse;
  Future getCourse() async {
    final headers = {
      "level": "Beginner",
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(Uri.parse(course), headers: headers);
    this.setState(() {
      jsonResponse = jsonDecode(response.body);
    });

    print(jsonResponse?[1]["coursename"]);
  }

  @override
  void initState() {
    this.getCourse();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Detail Level'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: ListView.builder(
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
                                    image: AssetImage(
                                        'assets/images/school-bag.png'),
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
                                        fontSize: 20,
                                        color: Color(0xFF363f93),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(color: Colors.black),
                                  Text(
                                    jsonResponse?[index]["description"],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('Edit'),
                                        onPressed: () => {},
                                      ),
                                      const SizedBox(width: 8),
                                      TextButton(
                                        child: const Text('Open'),
                                        onPressed: () => {},
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

  Widget buildTile(AdvancedTile tile) => ListTile(
      leading: tile.icon != null ? Icon(tile.icon) : null,
      title: Text(tile.title),
      onTap: tile.id != 0
          ? tile.method != 'Quiz'
              ? () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Materi(id: tile.id),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                    ),
                  );
                }
              : () => Get.to(QuizScreen())
          : null);
}
