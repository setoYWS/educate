import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class DetailModulTeacher extends StatefulWidget {
  int index;
  String modulid;
  DetailModulTeacher({Key? key, required this.index, required this.modulid})
      : super(key: key);
  @override
  _DetailModulTeacherState createState() => _DetailModulTeacherState();
}

class _DetailModulTeacherState extends State<DetailModulTeacher> {
  Map<String, dynamic>? jsonResponse, jsonResponseM;
  @override
  void initState() {
    super.initState();
    getModul();
  }

  Future getModul() async {
    final headers = {
      "id": widget.modulid,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(Uri.parse(moduldetail), headers: headers);
    this.setState(() {
      jsonResponse = jsonDecode(response.body);
    });
  }

  Future getNext() async {
    final headers = {
      "id": widget.modulid,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(Uri.parse(nextmodul), headers: headers);
    this.setState(() {
      jsonResponseM = jsonDecode(response.body);
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailModulTeacher(
                index: widget.index + 1, modulid: jsonResponseM?["_id"])));
  }

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.book_online_outlined,
              color: Colors.white,
              size: 40.0,
            ),
            Text(
              "0" + widget.index.toString(),
              style: TextStyle(color: Colors.white, fontSize: 50.0),
            ),
          ],
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          jsonResponse?["modulname"] ?? "",
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Beginner",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromARGB(255, 95, 1, 114)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      jsonResponse?["description"] ?? "",
      style: TextStyle(fontSize: 18.0),
    );
    final Button = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () => {Navigator.pop(context)},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 11, 29, 199)),
              ),
              child: Text("SEBELUMNYA", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () => {getNext()},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 11, 29, 199)),
              ),
              child: Text("SELANJUTNYA", style: TextStyle(color: Colors.white)),
            )
          ],
        ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, Button],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
