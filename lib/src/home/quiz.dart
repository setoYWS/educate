import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educate/src/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(50, 30),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.all(0),
  );
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            style: flatButtonStyle,
            onPressed: _controller.nextQuestion,
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          )
          // FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body(),
    );
  }
}
