import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/modules/bmiresult/BMI_Result.dart';
import 'package:my_app/modules/firstscreen/First_Screen.dart';

class BmiCalc extends StatefulWidget {
   final String? UserName;


  const BmiCalc ({ Key? key, @required this.UserName}): super(key: key);

  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  int SliderValue = 40;
  bool IsMale = true;
  int weight = 60;
  int Age = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "BMI Calculator",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout,),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(
              "Welcome ${widget.UserName}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: IsMale ? Colors.red : Colors.grey[900],
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            IsMale = true;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Oswald",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: !IsMale ? Colors.red : Colors.grey[900],
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            IsMale = false;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 50,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Oswald",
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                  child: Column(
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "$SliderValue",
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Oswald",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "CM",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Oswald",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: SliderValue.toDouble(),
                        onChanged: (value) {
                          SliderValue = value.toInt();
                          setState(
                            () {
                              setState(() {});
                            },
                          );
                        },
                        max: 200,
                        min: 0,
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey[900],
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "$weight",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: "Oswald",
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      weight++;
                                      setState(() {});
                                    },
                                    heroTag: "++",
                                    mini: true,
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      weight--;
                                      setState(() {});
                                    },
                                    heroTag: "--",
                                    mini: true,
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey[900],
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,

                                ),
                              ),
                              Text(
                                "${Age}",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: "Oswald",
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    heroTag: "a++",
                                    onPressed: () {
                                      Age++;
                                      setState(() {});
                                    },
                                    mini: true,
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    heroTag: "a--",
                                    onPressed: () {
                                      if (Age > 20) Age--;
                                      setState(() {});
                                    },
                                    mini: true,
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                double Res = weight / pow(SliderValue / 100, 2);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMI_Result(
                        Age: Age,
                        IsMale: IsMale,
                        Result: Res.round(),
                      ),
                    ));
              },
              child: Container(
                color: Colors.black,
                width: double.infinity,
                height: 70.0,
                child: Text(
                  "Calculate",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
