import 'package:flutter/material.dart';

import '../../models/itemmodel/itemmodel.dart';




class PhoneList extends StatelessWidget {
  List<ItemModel> ListItems = [
    ItemModel(
      1,
      "waleed zidan",
      "01154379336",
    ),
    ItemModel(
      2,
      "mohamed zidan",
      "0104016023",
    ),
    ItemModel(
      3,
      "leo Messi",
      "0120585316",
    ),
    ItemModel(
      4,
      "kareem zidan",
      "01154233658",
    ),
    ItemModel(
      5,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      6,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      7,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      8,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      9,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      10,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      11,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      12,
      "ahmed zidan",
      "011542235644",
    ),
    ItemModel(
      13,
      "ahmed zidan",
      "011542235644",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pohne List",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (Context,index)=>ItemModel.BuildItemModel(ListItems[index]),
                separatorBuilder:(Context,Index)=> Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                itemCount: ListItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
