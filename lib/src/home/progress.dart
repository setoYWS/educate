import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:educate/src/home/detail_level.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  _Progressstate createState() => _Progressstate();
}

class _Progressstate extends State<Progress> {
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          actions: [],
          title: Text(
            "Progress",
            style: TextStyle(fontSize: 29),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            height: 330,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 63, 27, 192),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Bahasa Inggris",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 20.0,
                    animation: true,
                    percent: 0.7,
                    center: new Text(
                      "70.0%",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                    // footer: new Text(
                    //   "Sales this week",
                    //   style: new TextStyle(
                    //       fontWeight: FontWeight.bold, fontSize: 17.0),
                    // ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Color.fromARGB(255, 233, 218, 7),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Overall Progress",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            // Container(
            //   child: Column(
            //     children: [
            //       LinearPercentIndicator(
            //         width: 250,
            //         lineHeight: 30,
            //         percent: 0.75,
            //         center: Text(
            //           '6/8',
            //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //         ),
            //         linearStrokeCap: LinearStrokeCap.roundAll,
            //         progressColor: Colors.blueAccent,
            //         backgroundColor: Colors.white,
            //         animation: true,
            //         animationDuration: 3000,
            //       )
            //     ],
            //   ),
            // ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Detail Progress",
            style: TextStyle(fontSize: 20),
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  LinearPercentIndicator(
                    padding: EdgeInsets.only(left: 40.0),
                    width: 200.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 30.0,
                    leading: new Text("Lesson"),
                    percent: 0.8,
                    center: Text("16/20"),
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: Color.fromARGB(255, 34, 250, 63),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LinearPercentIndicator(
                    padding: EdgeInsets.only(left: 60.0),
                    width: 220.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 30.0,
                    leading: new Text("Quiz"),
                    percent: 0.4,
                    center: Text("2/5"),
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: Colors.blue,
                  ),
                ],
              ),
            ),
            onTap: () => Get.to(AdvancedTilePage()),
          )
        ])));
  }
}
