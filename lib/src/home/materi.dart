import 'package:educate/main.dart';
import 'package:educate/src/models/materi.dart';
import 'package:educate/src/data/materi.dart';
import 'package:flutter/material.dart';
import 'package:educate/src/home/quiz.dart';
import 'package:get/get.dart';

class Materi extends StatefulWidget {
  final int id;
  const Materi({Key? key, required this.id}) : super(key: key);
  @override
  _MateriState createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Materi'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                categories[MaterialPageRoute as int].materi,
              ),
            ],
          ),
        ));
  }
}
