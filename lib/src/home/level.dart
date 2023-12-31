import 'dart:math';
import 'package:educate/main.dart';
import 'package:educate/src/home/config.dart';
import 'package:educate/src/home/detail_level.dart';
import 'package:educate/src/home/classlist_teacher.dart';
import 'package:educate/src/home/home.dart';
import 'package:get/get.dart';
import 'package:educate/src/home/quiz.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Levels extends StatefulWidget {
  const Levels({Key? key}) : super(key: key);

  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    var response = await http.post(Uri.parse(logout));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyApp(token: null)),
      ModalRoute.withName('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 1.7,
          title: Text("Jalur Pembelajaran"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  logoutUser();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            ListView(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                detail_level(level: "Beginner")));
                  },
                  child: lesson('assets/images/easter-egg.png', '2',
                      'Grammar I', Colors.cyan),
                ),
                const SizedBox(
                  height: 15,
                ),
                twolessons(
                  lesson('assets/images/message.png', '3', 'Vocabulary I',
                      Colors.orange),
                  lesson('assets/images/airplane.png', '3', 'Grammar II',
                      Colors.teal),
                ),
                const SizedBox(
                  height: 15,
                ),
                twolessons(
                  lesson('assets/images/food.png', '1', 'Vocabulary II',
                      Colors.green),
                  lesson(
                      'assets/images/family.png', '4', 'Summary', Colors.red),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            // ButtonTheme(
            //   height: 30,
            //   minWidth: 80,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10)),
            //   child: ElevatedButton(
            //     // color: Colors.red[600],
            //     //textColor: Colors.black,
            //     child: Text('Challenge'.toUpperCase()),
            //     onPressed: () {},
            //   ),
            // )
          ],
        ));
  }

  Widget appBarItem(String image, String num, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          image,
          height: 30,
        ),
        Text(
          num,
          style: TextStyle(color: color, fontSize: 15),
        ),
      ],
    );
  }

  Widget bonus() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.grey,
            size: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Bonus',
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget twolessons(Widget lesson1, Widget lesson2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        lesson1,
        const SizedBox(
          width: 10,
        ),
        lesson2,
      ],
    );
  }

  Widget lesson(String image, String number, String title, Color color) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.rotate(
                  angle: 3 * pi / 4,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.yellow),
                    value: Random().nextDouble(),
                    strokeWidth: 60,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                  ),
                ),
                CircleAvatar(
                  child: Image.asset(
                    image,
                    height: 35,
                  ),
                  backgroundColor: color,
                  radius: 35,
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/crown.png',
                  height: 30,
                ),
                Text(
                  number,
                  style: const TextStyle(color: Colors.deepOrangeAccent),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
