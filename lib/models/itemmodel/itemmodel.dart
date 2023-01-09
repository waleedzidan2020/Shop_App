import 'package:flutter/material.dart';

class ItemModel {
  final int id;
  final String Name;
  final String NumberPhone;

  ItemModel(this.id, this.Name, this.NumberPhone) {}

  static Widget BuildItemModel(ItemModel Item) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 35.0,
        child: Text(
          "${Item.id}",
          style: TextStyle(fontSize: 25, fontFamily: "Oswald"),
        ),
      ),
      SizedBox(width: 15),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${Item.Name} ",
              style: TextStyle(fontSize: 20, fontFamily: "Oswald"),
            ),
            Text(
              "+${Item.NumberPhone}",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
      )
    ],
  );
}
