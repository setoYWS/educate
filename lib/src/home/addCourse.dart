import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:educate/src/home/config.dart';
import 'package:educate/src/home/home_teacher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';

import 'components/customAppBar.dart';
import 'payload.dart';

class AddCourse extends StatefulWidget {
  @override
  _AddCourseState createState() => _AddCourseState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Beginner"), value: "Beginner"),
    DropdownMenuItem(child: Text("Intermediate"), value: "Intermediate"),
    DropdownMenuItem(child: Text("Advanced"), value: "Advanced"),
  ];
  return menuItems;
}

class _AddCourseState extends State<AddCourse> {
  final _formKey = GlobalKey<FormState>();
  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;
  String selectedValue = "Beginner";
  SharedPreferences? prefs;
  var jsonResponse, imagePath;
  TextEditingController coursenameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future addCourse(imageFilePath) async {
    final myToken = prefs?.getString('token') ?? '{}';
    final jwt = JWT.decode(myToken);
    final decoded = Payload.fromJson(jwt.payload);
    var request = http.MultipartRequest('POST', Uri.parse(newcourse));
    if (imagePath != null) {
      var multi = await http.MultipartFile.fromPath(
        'image',
        imageFilePath,
      );
      request.files.add(multi);
    }
    request.fields['instructorid'] = decoded.id ?? '';
    request.fields['coursename'] = coursenameController.text;
    request.fields['level'] = selectedValue;
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
                            builder: (context) => HomeTeacher(token: myToken)));
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
      appBar: CustomAppBar(
        'Tambah Class',
        lead: false,
        people: false,
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
                    controller: coursenameController,
                    decoration: new InputDecoration(
                      hintText: "English Class",
                      labelText: "Class Name",
                      icon: Icon(Icons.book),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name cant be empty';
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
                      labelText: "Class Description",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
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
                          value == null ? "Pilih Tingkat Kesulitan" : null,
                      dropdownColor: Color.fromARGB(255, 253, 253, 253),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
                ),
                ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text('Upload Photo'),
                ),
                ElevatedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(100, 40), //////// HERE
                  ),
                  onPressed: () {
                    addCourse(imagePath);
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
