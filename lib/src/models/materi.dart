import 'package:flutter/cupertino.dart';

class Materistodo {
  final int id;
  final String materi;
  final String image;

  Materistodo(this.id, this.materi, this.image);
  // const Materistodo({
  //   required this.id,
  //   required this.materi,
  //   required this.image,
  // });
}

List<Materistodo> categories = MateristodoData.map((item) => Materistodo(
        item['id'] as int, item['materi'] as String, item['image'] as String))
    .toList();

var MateristodoData = [
  {"id": 1, 'materi': "UI Design", 'image': "assets/images/marketing.png"},
  {"id": 2, 'materi': "RPL", 'image': "assets/images/ux_design.png"},
  {"id": 3, 'materi': "AOK", 'image': "assets/images/photography.png"},
  {"id": 4, 'materi': "Metpen", 'image': "assets/images/business.png"},
];
// const List sample_data_materi = [
//   {
//     "id": 1,
//     "materi": "Choose the group with all subject pronouns. ______",
//     "image": 'Image.asset("assets/images/message.png")',
//   },
//   {
//     "id": 2,
//     "materi":
//         "John ask for some candy, so his friend gave _____ a Tootsie Roll.",
//     "image": 'Image.asset("assets/images/food.png")',
//   },
//   {
//     "id": 3,
//     "materi": "Some kids don't know what to think of ______.",
//     "image": 'Image.asset("assets/images/message.png")',
//   },
//   {
//     "id": 4,
//     "materi": "Subject Pronouns are used in the ___________ of the sentence.",
//     "image": 'Image.asset("assets/images/message.png")',
//   },
//   {
//     "id": 5,
//     "materi": "Object pronouns are used in ________ of the sentence.",
//     "image": 'Image.asset("assets/images/message.png")',
//   },
// ];
