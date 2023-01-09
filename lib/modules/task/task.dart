import 'package:flutter/material.dart';

class task extends StatelessWidget {
  const task ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "New Tasks",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
