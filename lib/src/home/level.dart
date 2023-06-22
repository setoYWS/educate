import 'dart:math';
import 'package:educate/src/home/detail_level.dart';
import 'package:educate/src/home/classlist_teacher.dart';
import 'package:get/get.dart';
import 'package:educate/src/home/quiz.dart';
import 'package:flutter/material.dart';

class Levels extends StatefulWidget {
  const Levels({Key? key}) : super(key: key);

  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 1.7,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                'assets/images/indo.png',
                height: 30,
              ),
              appBarItem('assets/images/crown.png', '12', Colors.yellow),
              appBarItem('assets/images/offFire.png', '0', Colors.grey),
              appBarItem('assets/images/gem.png', '111', Colors.red),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.person,
            color: Colors.pink,
            size: 30,
          ),
          backgroundColor: Color.fromARGB(255, 58, 91, 201),
          onPressed: () => Get.to(classlist_teacher()),
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
                  onTap: () => Get.to(AdvancedTilePage()),
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
                twolessons(bonus(), bonus()),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 10),
                lesson(
                    'assets/images/easter-egg.png', '2', 'Intro', Colors.cyan),
                const SizedBox(
                  height: 15,
                ),
                twolessons(
                  lesson('assets/images/message.png', '3', 'Phrases',
                      Colors.orange),
                  lesson(
                      'assets/images/airplane.png', '3', 'Travel', Colors.teal),
                ),
                const SizedBox(
                  height: 15,
                ),
                twolessons(
                  lesson('assets/images/food.png', '1', 'Restaurant',
                      Colors.green),
                  lesson('assets/images/family.png', '4', 'Family', Colors.red),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 2,
                ),
                twolessons(bonus(), bonus()),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 10),
                lesson(
                    'assets/images/easter-egg.png', '2', 'Intro', Colors.cyan),
                const SizedBox(
                  height: 15,
                ),
                twolessons(
                  lesson('assets/images/message.png', '3', 'Phrases',
                      Colors.orange),
                  lesson(
                      'assets/images/airplane.png', '3', 'Travel', Colors.teal),
                ),
                const SizedBox(
                  height: 15,
                ),
                twolessons(
                  lesson('assets/images/food.png', '1', 'Restaurant',
                      Colors.green),
                  lesson('assets/images/family.png', '4', 'Family', Colors.red),
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
