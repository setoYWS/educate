import 'dart:convert';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:educate/src/home/detail_modulTeacher.dart';
import 'package:educate/src/home/participant_list.dart';
import 'package:educate/src/home/payload.dart';
import 'package:educate/src/home/quiz.dart';
import 'package:educate/src/home/quizPageStudent.dart';
import 'package:educate/src/home/tambah_materi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'components/customAppBar.dart';
import 'config.dart';

class DetailClass extends StatefulWidget {
  String courseid;
  DetailClass({required this.courseid, Key? key}) : super(key: key);
  @override
  _DetailClassState createState() => _DetailClassState();
}

class _DetailClassState extends State<DetailClass> {
  SharedPreferences? prefs;
  List? jsonResponseM;
  List? jsonResponseQ;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
    final myToken = prefs?.getString('token') ?? '{}';
    final jwt = JWT.decode(myToken);
    final decoded = Payload.fromJson(jwt.payload);
    getModulCourse();
    getQuizCourse();
  }

  Future getModulCourse() async {
    final headersM = {
      "cid": widget.courseid,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var responseM = await http.get(Uri.parse(modul), headers: headersM);
    this.setState(() {
      jsonResponseM = jsonDecode(responseM.body);
    });
  }

  Future getQuizCourse() async {
    final headersQ = {
      "cid": widget.courseid,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var responseQ = await http.get(Uri.parse(quizdata), headers: headersQ);
    this.setState(() {
      jsonResponseQ = jsonDecode(responseQ.body);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Class",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.red,
                Color.fromRGBO(5, 134, 240, 0.856)
              ])),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.people,
              color: Color.fromARGB(255, 3, 68, 121),
            ),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ParticipantList(
                            courseid: widget.courseid,
                          )))
            },
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 30,
        ),
        backgroundColor: Color.fromARGB(255, 58, 91, 201),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TambahMateri(
                        courseid: widget.courseid,
                      )));
        },
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: jsonResponseM == null ? 0 : jsonResponseM?.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailModulTeacher(
                                index: index + 1,
                                modulid: jsonResponseM?[index]["_id"])));
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        height: 82,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              height: 82,
                              width: 99,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 171, 17, 218),
                                  borderRadius: BorderRadius.circular(19)),
                              child: Center(
                                child: Text(
                                  "M",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    jsonResponseM?[index]["modulname"],
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      )),
                );
              }),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: jsonResponseQ == null ? 0 : jsonResponseQ?.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        height: 82,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              height: 82,
                              width: 99,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 245, 26, 44),
                                  borderRadius: BorderRadius.circular(19)),
                              child: Center(
                                child: Text(
                                  "Q",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    jsonResponseQ?[index]["quizname"],
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      )),
                );
              })
        ],
      )));
}
