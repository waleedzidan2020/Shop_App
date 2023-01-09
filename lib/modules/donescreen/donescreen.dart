import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Done Tasks",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
