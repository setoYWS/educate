// import 'package:educate/src/home/quiz.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class daftarlevel extends StatelessWidget {
//   const daftarlevel({Key? key}) : super(key: key);

//   static const String _title = 'Grammar I';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.blue,
//           elevation: 1.7,
//           title: const Text(_title)),
//       body: new ListView.builder(
//         itemBuilder: (BuildContext context, int index) {
//           return new ExpandableListView(title: "Lesson $index");
//         },
//         itemCount: 5,
//       ),
//     );
//   }
// }

// List<String> lesson = [
//   "Subject Pronouns",
//   "Demonstrative pronouns",
//   "Question words",
//   "Possesive Adjectiveness",
//   "Singular and Plural nouns",
//   "simple verb"
// ];

// // stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'The subject pronouns',
//       expandedValue: 'Pada materi ini kamu akan belajar tentang: ',
//     );
//   });
// }

// class detailLevel extends StatefulWidget {
//   const detailLevel({Key? key}) : super(key: key);

//   @override
//   _detailLevelState createState() => _detailLevelState();
// }

// class _detailLevelState extends State<detailLevel> {
//   final List<Item> _data = generateItems(5);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: _buildPanel(),
//       ),
//     );
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _data[index].isExpanded = !isExpanded;
//         });
//       },
//       children: _data.map<ExpansionPanel>((Item item) {
//         return ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.headerValue),
//             );
//           },
//           body: ListTile(
//             title: Text(item.expandedValue),
//             subtitle: const Text(
//                 '- Penggunaan subjek saya, kamu, dia laki-laki, dia perempuan, mereka'),
//             trailing: const Icon(Icons.play_circle),
//             onTap: () => Get.to(QuizScreen()),
//           ),
//           isExpanded: item.isExpanded,
//         );
//       }).toList(),
//     );
//   }
// }
// class ExpandableListView extends StatefulWidget {
//   final String title;

//   const ExpandableListView({Key? key, required this.title}) : super(key: key);

//   @override
//   _ExpandableListViewState createState() => new _ExpandableListViewState();
// }

// class _ExpandableListViewState extends State<ExpandableListView> {
//   bool expandFlag = false;

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: new EdgeInsets.symmetric(vertical: 1.0),
//       child: new Column(
//         children: <Widget>[
//           new Container(
//             color: Colors.blue,
//             padding: new EdgeInsets.symmetric(horizontal: 5.0),
//             child: new Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 new IconButton(
//                     icon: new Container(
//                       height: 50.0,
//                       width: 50.0,
//                       decoration: new BoxDecoration(
//                         color: Colors.orange,
//                         shape: BoxShape.circle,
//                       ),
//                       child: new Center(
//                         child: new Icon(
//                           expandFlag
//                               ? Icons.keyboard_arrow_up
//                               : Icons.keyboard_arrow_down,
//                           color: Colors.white,
//                           size: 30.0,
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         expandFlag = !expandFlag;
//                       });
//                     }),
//                 new Text(
//                   widget.title,
//                   style: new TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//           new ExpandableContainer(
//               expanded: expandFlag,
//               child: new ListView.builder(
//                 itemBuilder: (BuildContext context, int index) {
//                   return new Container(
//                     decoration: new BoxDecoration(
//                         border: new Border.all(width: 1.0, color: Colors.grey),
//                         color: Colors.black),
//                     child: new ListTile(
//                       title: new Text(
//                         lesson[index],
//                         style: new TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.white),
//                       ),
//                       leading: new Icon(
//                         Icons.book,
//                         color: Colors.white,
//                       ),
//                       onTap: () => Get.to(QuizScreen()),
//                     ),
//                   );
//                 },
//                 itemCount: 15,
//               ))
//         ],
//       ),
//     );
//   }
// }

// class ExpandableContainer extends StatelessWidget {
//   final bool expanded;
//   final double collapsedHeight;
//   final double expandedHeight;
//   final Widget child;

//   ExpandableContainer({
//     required this.child,
//     this.collapsedHeight = 0.0,
//     this.expandedHeight = 300.0,
//     this.expanded = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return new AnimatedContainer(
//       duration: new Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//       width: screenWidth,
//       height: expanded ? expandedHeight : collapsedHeight,
//       child: new Container(
//         child: child,
//         decoration: new BoxDecoration(
//             border: new Border.all(width: 1.0, color: Colors.blue)),
//       ),
//     );
//   }
// }

import 'package:educate/src/data/advanced_tile.dart';
import 'package:educate/src/data/materi.dart';
import 'package:educate/src/home/materi.dart';
import 'package:educate/src/models/advanced_tile.dart';
import 'package:educate/src/models/materi.dart';
import 'package:educate/src/models/utils.dart';
import 'package:educate/main.dart';
import 'package:flutter/material.dart';
import 'package:educate/src/home/quiz.dart';
import 'package:get/get.dart';

class AdvancedTilePage extends StatefulWidget {
  @override
  _AdvancedTilePageState createState() => _AdvancedTilePageState();
}

class _AdvancedTilePageState extends State<AdvancedTilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Detail Level'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList.radio(
            expansionCallback: (index, isExpanded) {
              final tile = advancedTiles[index];
              setState(() => tile.isExpanded = isExpanded);
            },
            children: advancedTiles
                .map((tile) => ExpansionPanelRadio(
                      value: tile.title,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) => buildTile(tile),
                      body: Column(
                        children: tile.tiles.map(buildTile).toList(),
                      ),
                    ))
                .toList(),
          ),
        ),
      );

  Widget buildTile(AdvancedTile tile) => ListTile(
      leading: tile.icon != null ? Icon(tile.icon) : null,
      title: Text(tile.title),
      onTap: tile.id != 0
          ? tile.method != 'Quiz'
              ? () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Materi(id: tile.id),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                    ),
                  );
                }
              : () => Get.to(QuizScreen())
          : null);
}
