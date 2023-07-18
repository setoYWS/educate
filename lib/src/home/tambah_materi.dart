import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:educate/src/home/detail_class.dart';
import 'package:educate/src/home/materi_form.dart';
import 'package:educate/src/home/payload.dart';
import 'package:educate/src/home/quiz_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'config.dart';
import 'home_teacher.dart';

class TambahMateri extends StatefulWidget {
  String courseid;
  TambahMateri({required this.courseid, Key? key}) : super(key: key);
  @override
  _TambahMateriState createState() => _TambahMateriState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Modul"), value: "Modul"),
    DropdownMenuItem(child: Text("Kuis"), value: "Kuis"),
  ];
  return menuItems;
}

class _TambahMateriState extends State<TambahMateri> {
  final _formKey = GlobalKey<FormState>();

  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;
  String selectedValue = "Modul";
  SharedPreferences? prefs;
  var jsonResponse, imagePath;
  TextEditingController materinameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future addModul(imageFilePath) async {
    final myToken = prefs?.getString('token') ?? '{}';
    final jwt = JWT.decode(myToken);
    final decoded = Payload.fromJson(jwt.payload);
    var request = http.MultipartRequest('POST', Uri.parse(newmodul));
    var multi = await http.MultipartFile.fromPath(
      'image',
      imageFilePath,
    );
    request.files.add(multi);
    request.fields['courseid'] = widget.courseid;
    request.fields['modulname'] = materinameController.text;
    request.fields['description'] = descriptionController.text;
    var res = await request.send();
    jsonResponse = await http.Response.fromStream(res);
    final result = jsonDecode(jsonResponse.body);

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailClass(
                                  courseid: widget.courseid,
                                )));
                  },
                  child: Text("OK")),
            ],
            content: Text(result["message"]),
          );
        });
  }

  Future pickImage() async {
// show a dialog to open a file
    FilePickerResult? file =
        await FilePicker.platform.pickFiles(type: FileType.image);
    imagePath = file?.files.first.path;
    print(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Materi"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: materinameController,
                    decoration: new InputDecoration(
                      hintText: "English Class",
                      labelText: "Lesson Title",
                      icon: Icon(Icons.book),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Title cant be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionController,
                    obscureText: false,
                    decoration: new InputDecoration(
                      labelText: "Lesson Description",
                      icon: Icon(Icons.text_fields),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Description cant be empty';
                      }
                      return null;
                    },
                  ),
                ),
                // CheckboxListTile(
                //   title: Text('Quiz'),
                //   subtitle: Text('Dapat berisi Multiple Choices, Isian'),
                //   value: nilaiCheckBox,
                //   activeColor: Colors.deepPurpleAccent,
                //   onChanged: (value) {
                //     setState(() {
                //       nilaiCheckBox = value!;
                //     });
                //   },
                // ),
                // SwitchListTile(
                //   title: Text('Materi'),
                //   subtitle: Text('Dapat berisi teks, video'),
                //   value: nilaiSwitch,
                //   activeTrackColor: Colors.pink[100],
                //   activeColor: Colors.red,
                //   onChanged: (value) {
                //     setState(() {
                //       nilaiSwitch = value;
                //     });
                //   },
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Pilih Tipe Materi",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 68, 66, 66),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    validator: (value) =>
                        value == null ? "Pilih Tipe Materi" : null,
                    dropdownColor: Color.fromARGB(255, 253, 253, 253),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems),
                Visibility(
                  child: ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: Text('Upload Photo'),
                  ),
                  visible: selectedValue == "Modul",
                ),
                ElevatedButton(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(100, 40), //////// HERE
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedValue == "Kuis") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionForm()),
                        );
                        print("sukses");
                      } else {
                        addModul(imagePath);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
