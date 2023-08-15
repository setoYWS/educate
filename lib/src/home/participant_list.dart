import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'config.dart';
import 'package:http/http.dart' as http;

class ParticipantList extends StatefulWidget {
  String courseid;
  ParticipantList({Key? key, required this.courseid}) : super(key: key);

  @override
  _ParticipantListState createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  Map<String, dynamic>? jsonResponse;

  @override
  void initState() {
    super.initState();
    getParticipant();
  }

  Future getParticipant() async {
    final headers = {
      "courseid": widget.courseid,
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response =
        await http.get(Uri.parse(participantlister), headers: headers);
    this.setState(() {
      jsonResponse = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 160.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                        Colors.red,
                        Color.fromRGBO(5, 134, 240, 0.856)
                      ])),
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "Participant List",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 3, 68, 121),
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: MediaQuery.removePadding(
            context: context,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: jsonResponse?.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1661209851626-20d6fb8022e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"),
                          ),
                          title: Text(jsonResponse?[index]['studentid'] ?? ""),
                          subtitle: Text("@gmail.com"),
                          trailing: ButtonBar(
                              alignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextButton(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {},
                                ),
                                TextButton(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {},
                                ),
                              ])));
                }),
          ))
        ],
      ),
    );
  }
}
