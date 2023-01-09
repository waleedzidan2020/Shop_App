import 'package:flutter/material.dart';

class Massenger extends StatelessWidget {
  Widget BuildItemChat() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://mediaproxy.salon.com/width/1200/https://media.salon.com/2013/09/breaking_bad_sirota.jpg"),
              ),
              Container(
                margin: EdgeInsets.only(top: 48.0, left: 45),
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Walete White",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontFamily: "Oswald"),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        " Hello Master",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        bottom: 4,
                      ),
                      child: Container(
                        width: 8,
                        height: 7,
                        child: CircleAvatar(
                          radius: 2,
                        ),
                      ),
                    ),
                    Text("12:00 Pm")
                  ],
                )
              ],
            ),
          ),
        ],
      );
  Widget BuildItemStatus() => Container(
        width: 70,
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      "https://mediaproxy.salon.com/width/1200/https://media.salon.com/2013/09/breaking_bad_sirota.jpg"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 55.0, left: 50),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "Walter White",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/en/0/03/Walter_White_S5B.png"),
            radius: 27.0,
          ),
        ),
        title: Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 22.0,
            backgroundColor: Colors.blue,
            child: MaterialButton(
              padding: EdgeInsets.only(
                right: 0.41,
              ),
              onPressed: () {},
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 22.0,
            backgroundColor: Colors.blue,
            child: MaterialButton(
              padding: EdgeInsets.only(
                right: 0.41,
              ),
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: EdgeInsets.symmetric(vertical: 7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey,
                ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.search,
                      ),
                      margin: EdgeInsets.only(left: 15.0),
                    ),
                    Container(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      margin: EdgeInsets.only(left: 15.0),
                    ),
                  ],
                ),
              ), //Search Elemnt
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 120.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (Context, index) => BuildItemStatus(),
                  separatorBuilder: (Context, index) => SizedBox(
                    width: 12,
                  ),
                  itemCount: 8,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                itemBuilder: (context, index) => BuildItemChat(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
