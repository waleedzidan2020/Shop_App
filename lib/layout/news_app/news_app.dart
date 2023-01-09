import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';
import 'package:my_app/modules/searchscreen/SearchScreen.dart';
import 'package:my_app/shared/components/components.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

class NewsApp extends StatelessWidget {
   NewsApp({Key? key}) : super(key: key);
  bool isdark=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(

          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                onPressed: (){
                  cubit.ChangeMode();
                },
                icon: Icon(
                  Icons.brightness_4_rounded,


                ),
              ),
              IconButton(
                onPressed: (){
                 Navigateto(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,


                ),
              ),
            ],
          ),
          body: cubit.Screens[cubit.CurentIndex],
          bottomNavigationBar: BottomNavigationBar(

            type: BottomNavigationBarType.fixed,
            selectedFontSize: 20,

            items: cubit.ListBottomItem,
            currentIndex: cubit.CurentIndex,
            onTap: (index) {
              cubit.ChangeBottomNave(index);
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
