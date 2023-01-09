import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.settings,
        ),
      ),
      body: Container(
        color: Colors.teal,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.deepOrangeAccent,
              width: double.infinity,
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    color: Colors.limeAccent,
                    margin: EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_alarm_sharp),
                      color: Colors.black,
                      splashRadius: 20.0,
                    ),
                  ),
                  Container(
                    color: Colors.limeAccent,
                    margin: EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_alarm_sharp),
                      color: Colors.black,
                      splashRadius: 20.0,
                    ),
                  ),
                  Container(
                    color: Colors.limeAccent,
                    margin: EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_alarm_sharp),
                      color: Colors.black,
                      splashRadius: 20.0,
                    ),
                  ),
                  Container(
                    color: Colors.limeAccent,
                    margin: EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_alarm_sharp),
                      color: Colors.black,
                      splashRadius: 20.0,
                    ),
                  ),
                  Container(
                    color: Colors.limeAccent,
                    margin: EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_alarm_sharp),
                      color: Colors.black,
                      splashRadius: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: 300,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 75,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-760w,f_auto,q_auto:best/streams/2013/August/130808/6C8558749-130808-walter-white-tease.jpg"),
                            radius: 70,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
