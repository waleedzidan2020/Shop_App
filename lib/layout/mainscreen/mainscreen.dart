import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/modules/archived/archived.dart';
import 'package:my_app/modules/donescreen/donescreen.dart';
import 'package:my_app/modules/task/task.dart';
import 'package:my_app/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _State();
}

class _State extends State<MainScreen> {
  Database? database;

  int IndexTapped = 0;
  List<Widget> ListScreens = [
    task(),
    DoneScreen(),
    ArchivedScreen(),
  ];
  GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey<ScaffoldState>();
  bool BottomSheetOpen = false;
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  TextEditingController? PasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(
        title: Text(
          "Todo",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CreateDatabase();
          InsertIntoDatabase();

          if (BottomSheetOpen == true &&
              FormKey.currentState?.validate() == true) {
            Navigator.pop(context);
            BottomSheetOpen = false;
          } else {
            ScaffoldKey.currentState?.showBottomSheet(
              (context) => Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: double.infinity,
                  child: Form(
                    key: FormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Textfield(
                            prefixIcons: Icon(
                              Icons.task,
                            ),
                            Label: "New Task",
                            valid: (String? value) {
                              if (value != null && value.isEmpty)
                                return "you must fill this field";
                              else
                                return null;
                            }),
                        Textfield(
                            passwordtext: PasswordController,
                            KeyboardType: TextInputType.none,
                            prefixIcons: Icon(Icons.watch),
                            Label: "New Task",
                            valid: (String? value) {
                              if (value != null && value.isEmpty)
                                return "you must fill this field";
                              else
                                return null;
                            },
                            ontap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                print(value!.format(context));
                                PasswordController?.text =
                                    value!.format(context).toString();
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.grey,
            );
            BottomSheetOpen = true;
          }
        },
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: IndexTapped,
        onTap: (value) {
          IndexTapped = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task,
            ),
            label: "task",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
            ),
            label: "Done",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: "Archived",
          ),
        ],
      ),
      body: ListScreens[IndexTapped],
    );
  }

  void CreateDatabase() async {
    database = await openDatabase('ii.db', version: 1,
        onCreate: (database, version) async {
      await database
          .execute(
              'CREATE TABLE kk (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)')
          .then((value) {
        print("cretaettttt");
      });
      print("table created");
    }, onOpen: (database) async {
      print(database) ;
     await  GetFromDatabase(database).then((value) {
        print(value.length);
      });
      print("open  database ");
    }).then((value) {
      print(value);
    });
  }

  void InsertIntoDatabase() async {
    await database?.transaction((txn) async {
       await txn.rawQuery(
           'INSERT INTO kk(name, value, num) VALUES(?, ?, ?)',
           ['another name', 12345678, 3.1416]);
    }).then((value) {
      print(value);
      print("a7a");
      return null;
    });
  }

  Future<List<Map>> GetFromDatabase(Database? database) async {
    return await database!.rawQuery('SELECT * FROM kk');
  }
}
