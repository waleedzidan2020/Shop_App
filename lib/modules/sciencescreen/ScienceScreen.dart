import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var List = NewsCubit.get(context).ItemScience;
        var ListSearch = NewsCubit.get(context).SearchItem;

        return ConditionalBuilder(
          condition: List.length>0,
          builder: (context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index)=> ItemNews(List[index],context) ,
            separatorBuilder:(context,index)=>SizedBox(
              height: 15,
            ) ,
            itemCount: List.length,


          ),
          fallback: (context)=>Center(
          child: ListSearch.length==0?Container(): CircularProgressIndicator(
        color: Colors.deepOrange,
        ),
        ),
        );
      },

      listener: (context, state) {},
    );
  }
}
