import 'package:educate/src/home/level.dart';
import 'package:educate/src/home/leaderboard.dart';
import 'package:educate/src/home/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Levels(),
    Leaderboard(),
    Progress(),
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
            icon: ImageIcon(AssetImage("assets/images/level.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/level2.png")),
            label: 'Level',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/shield.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/shield2.png")),
            label: 'Rank',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/market.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/market2.png")),
            label: 'Progress',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
