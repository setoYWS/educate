import 'package:educate/src/home/classlist_peserta.dart';
import 'package:educate/src/home/level.dart';
import 'package:educate/src/home/leaderboard.dart';
import 'package:educate/src/home/progress.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class Home extends StatefulWidget {
  final token;
  Home({@required this.token, Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Levels(),
    Leaderboard(),
    classlist_peserta(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late String userId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    userId = jwtDecodedToken['_id'];
  }

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
            label: 'My Class',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
