import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';
import 'package:my_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var List = NewsCubit.get(context).itemBusiness;
        var ListSearch = NewsCubit.get(context).SearchItem;




        return ConditionalBuilder(
          condition: List.length>0,
          builder:(context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index)=> ItemNews(List[index],context) ,
            separatorBuilder:(context,index)=>SizedBox(
              height: 15,
            ) ,
            itemCount: List.length,


          ),
          fallback: (Context)=>Center(
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
