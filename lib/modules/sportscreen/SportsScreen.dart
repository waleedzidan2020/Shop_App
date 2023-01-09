import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';

import '../../shared/components/components.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state) {
        var List =NewsCubit.get(context).itemSports;

        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder:(context,index)=> ItemNews(List[index],context) ,
          separatorBuilder:(context,index)=>SizedBox(
            height: 15,
          ) ,
          itemCount: List.length,


        );

      },

      listener: (context,state){},
    );
  }
}
