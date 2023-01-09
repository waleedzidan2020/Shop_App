import 'dart:ffi';

import 'package:flutter/material.dart';

class BMI_Result extends StatelessWidget {
  final IsMale;
  final Result  ;
  final Age  ;
  BMI_Result({
    this.Age,
    this.IsMale,
    this.Result
  }){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Result",
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gender:${IsMale ? "Male":"Female" }",
                style: TextStyle(
                  fontFamily: "Oswald",
                  fontSize: 30,
                ),
              ),
              Text(
                "Result:$Result",
                style: TextStyle(
                  fontFamily: "Oswald",
                  fontSize: 30,
                ),
              ),
              Text(
                "Age:$Age",
                style: TextStyle(
                  fontFamily: "Oswald",
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
