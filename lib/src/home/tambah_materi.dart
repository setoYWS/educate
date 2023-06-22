import 'package:educate/src/home/materi_form.dart';
import 'package:educate/src/home/quiz_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahMateri extends StatefulWidget {
  @override
  _TambahMateriState createState() => _TambahMateriState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Materi"), value: "Materi"),
    DropdownMenuItem(child: Text("Kuis"), value: "Kuis"),
  ];
  return menuItems;
}

class _TambahMateriState extends State<TambahMateri> {
  final _formKey = GlobalKey<FormState>();

  double nilaiSlider = 1;
  bool nilaiCheckBox = false;
  bool nilaiSwitch = true;
  String selectedValue = "Materi";

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MateriForm()),
                        );
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
