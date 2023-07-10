import 'package:educate/main.dart';
import 'package:educate/src/home/config.dart';
import 'package:http/http.dart' as http;
import 'package:educate/src/home/profile_teacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educate/src/home/participant_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  final bool lead;

  final bool people;

  CustomAppBar(
    this.title, {
    Key? key,
    required this.lead,
    required this.people,
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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

    if (people == true) {
      return AppBar(
        centerTitle: true,
        title: Text(
          title,
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
            onPressed: () => Get.to(ParticipantList()),
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 11, 228, 199),
              height: 10.0,
              child: Text("Persenan progres"),
            ),
            preferredSize: Size.fromHeight(10.0)),
        automaticallyImplyLeading: lead,
      );
    } else if (lead == false) {
      return AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color.fromARGB(255, 3, 68, 121),
          ),
          onPressed: () => {},
        ),
        title: Text(
          title,
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
              Icons.person,
              color: Color.fromARGB(255, 3, 68, 121),
            ),
            onPressed: () => Get.to(ProfileTeacher()),
          ),
          IconButton(
              onPressed: () {
                logoutUser();
              },
              icon: Icon(Icons.logout))
        ],
        automaticallyImplyLeading: lead,
      );
    } else {
      return AppBar(
        centerTitle: true,
        title: Text(
          title,
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
        automaticallyImplyLeading: lead,
      );
    }
  }
}
