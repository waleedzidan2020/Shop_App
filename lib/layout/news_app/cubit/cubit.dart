import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';
import 'package:my_app/modules/businessscreen/BusinessScreen.dart';
import 'package:my_app/modules/sciencescreen/ScienceScreen.dart';
import 'package:my_app/modules/settingscreen/SettingScreen.dart';
import 'package:my_app/modules/sportscreen/SportsScreen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> Screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];

     bool IsDark=false;
  void ChangeMode(){
    IsDark=!IsDark;

    emit(NewsModeThemeState());
  }
  List<BottomNavigationBarItem> ListBottomItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_sharp,
        color: Colors.orangeAccent,
      ),
      label: "Business",

    ),
    BottomNavigationBarItem(

      icon: Icon(
        Icons.sports_football,
        color: Colors.orangeAccent,

      ),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
        color: Colors.orangeAccent,
      ),
      label: "Science",


    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
        color: Colors.orangeAccent,
      ),
      label: "Setting",
    ),

  ];

  int CurentIndex = 0;
  List<dynamic> itemBusiness=[];
  List<dynamic> itemSports=[];
  List<dynamic> ItemScience=[];
  List<dynamic> SearchItem=[];

  void ChangeBottomNave (int index){
    emit(NewsLoadingState());
    CurentIndex=index;
    if(index==1)
      GetDataSports();
    else if(index==2)
      GetDataScience();

    emit(NewsBottomNavChangeState());
  }

  void GetData (){
    emit(NewsLoadingState());
    DioHelper.GetData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'apiKey':'3c675dd7ee6a48ceb2f3e9abd8fb1bfa',
      },
    ).then((value){

      itemBusiness=value.data['articles'];

      emit(NewsGetDataBusinessSucssesState());
    });


  }
  void GetDataSports (){
    DioHelper.GetData(
      url: 'v2/top-headlines',
      query: {

        'sources':'bbc-news',
        'apiKey':'3c675dd7ee6a48ceb2f3e9abd8fb1bfa',
      },
    ).then((value){

      itemSports=value.data['articles'];

      emit(NewsGetDataSportsSucssesState());
    });


  }
  void GetDataScience (){
    DioHelper.GetData(
      url: 'v2/top-headlines',
      query: {
        'country':'de',
        'category':'business',
        'apiKey':'3c675dd7ee6a48ceb2f3e9abd8fb1bfa',
      },
    ).then((value){

      ItemScience=value.data['articles'];

      emit(NewsGetDataScienceSucssesState());
    });


  }
  void Search (String Value){
    DioHelper.GetData(
      url: 'v2/top-headlines',
      query: {
        'q':'$Value',
        'category':'business',
        'apiKey':'3c675dd7ee6a48ceb2f3e9abd8fb1bfa',
      },
    ).then((value){

      SearchItem=value.data['articles'];

      emit(NewsGetDataScienceSucssesState());
    });


  }

}
