import 'package:educate/src/home/detail_class.dart';
import 'package:educate/src/home/edit_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/customAppBar.dart';

class classlist_teacher extends StatefulWidget {
  const classlist_teacher({Key? key}) : super(key: key);

  @override
  _Classlist_teacherState createState() => _Classlist_teacherState();
}

class _Classlist_teacherState extends State<classlist_teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        'Class List',
        lead: false,
        people: false,
      ),
      body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  Container(
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
                  Container(
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
                                    image:
                                        AssetImage('assets/images/abacus.png'),
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
                                    "Grammar Class",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF363f93),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(color: Colors.black),
                                  Text(
                                    "Learning Grammar from Basic within few days",
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
                  Container(
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
                ],
              ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 30,
        ),
        backgroundColor: Color.fromARGB(255, 58, 91, 201),
        onPressed: () => Get.to(EditClass()),
      ),
    );
  }
}
