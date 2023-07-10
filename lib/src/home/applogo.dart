import 'package:flutter/material.dart';

class CommonLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://pluspng.com/img-png/avengers-logo-png-avengers-logo-png-1376.png",
          width: 100,
        ),
        Text(
          "Educate",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "Helping you learning English",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
