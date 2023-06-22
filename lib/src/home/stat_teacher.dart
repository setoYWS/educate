import 'package:educate/src/home/detail_class.dart';
import 'package:educate/src/home/edit_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/customAppBar.dart';

class StatTeacher extends StatefulWidget {
  const StatTeacher({Key? key}) : super(key: key);

  @override
  _StatTeacherState createState() => _StatTeacherState();
}

class _StatTeacherState extends State<StatTeacher> {
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
                SizedBox(
                  height: 210,
                  child: Container(
                    height: 100,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 5,
                            left: 10,
                            child: Material(
                              child: Container(
                                height: 200,
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
                          top: 5,
                          left: 10,
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
                                    "Basic Class",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF363f93),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(color: Colors.black),
                                  Text(
                                    "Learning Basic English within few days",
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
                                        onPressed: () => Get.to(EditClass()),
                                      ),
                                      const SizedBox(width: 8),
                                      TextButton(
                                        child: const Text('Open'),
                                        onPressed: () => Get.to(DetailClass()),
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 210,
                  child: Container(
                    height: 230,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 5,
                            left: 10,
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
                          top: 5,
                          left: 10,
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
                                    image:
                                        AssetImage('assets/images/science.png'),
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
                                    "Vocabulary Class",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF363f93),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(color: Colors.black),
                                  Text(
                                    "Learning Vocabulary from Basic within few days",
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
                                        onPressed: () => Get.to(EditClass()),
                                      ),
                                      const SizedBox(width: 8),
                                      TextButton(
                                        child: const Text('Open'),
                                        onPressed: () => Get.to(DetailClass()),
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
