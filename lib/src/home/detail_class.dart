import 'package:educate/src/data/advanced_tile.dart';
import 'package:educate/src/data/materi.dart';
import 'package:educate/src/home/materi.dart';
import 'package:educate/src/home/tambah_materi.dart';
import 'package:educate/src/models/advanced_tile.dart';
import 'package:educate/src/models/materi.dart';
import 'package:educate/src/models/utils.dart';
import 'package:educate/main.dart';
import 'package:flutter/material.dart';
import 'package:educate/src/home/quiz.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'components/customAppBar.dart';

class DetailClass extends StatefulWidget {
  @override
  _DetailClassState createState() => _DetailClassState();
}

class _DetailClassState extends State<DetailClass> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CustomAppBar(
          'Course List',
          lead: true,
          people: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
          backgroundColor: Color.fromARGB(255, 58, 91, 201),
          onPressed: () => Get.to(TambahMateri()),
        ),
        body: Container(
            child: Column(
          children: [
            Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      children: [
                        Container(
                          height: 60,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 5,
                                  left: 20,
                                  child: Material(
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              offset: Offset(-10.0, 10.0),
                                              blurRadius: 20.0,
                                              spreadRadius: 4.0),
                                        ],
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: 10,
                                  left: 40,
                                  child: Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Subject and Pronounce      (1/2)",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF363f93),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 5,
                                  left: 20,
                                  child: Material(
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              offset: Offset(-10.0, 10.0),
                                              blurRadius: 20.0,
                                              spreadRadius: 4.0),
                                        ],
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  top: 10,
                                  left: 40,
                                  child: Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Subject and Pronounce      (2/2)",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF363f93),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(QuizScreen()),
                          child: Container(
                            height: 60,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 5,
                                    left: 20,
                                    child: Material(
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                offset: Offset(-10.0, 10.0),
                                                blurRadius: 20.0,
                                                spreadRadius: 4.0),
                                          ],
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: Container(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Subject and Pronounce (Quiz)",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF363f93),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    )))
          ],
        )),
      );
}
