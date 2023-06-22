import 'package:educate/src/home/classlist_teacher.dart';
import 'package:educate/src/home/stat_teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({Key? key}) : super(key: key);

  @override
  _HomeTeacherState createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    StatTeacher(),
    classlist_teacher(),
    classlist_teacher(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/shield.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/shield2.png")),
            label: 'Class',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/market.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/market2.png")),
            label: 'Rank',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
