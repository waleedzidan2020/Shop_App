import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';

import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state){
        var ListOfSeach=NewsCubit.get(context).SearchItem;
        return Scaffold(
          appBar: AppBar(
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfield(
                  onchange: (value){
                    NewsCubit.get(context).Search(value);
                  },
                  Label: "Search",
                  KeyboardType: TextInputType.text,
                  passwordtext:SearchController ,
                  ontap: (){},

                  valid: ( String? value){
                    if(value!.isEmpty){
                      return "Misseing field";

                    }
                    else return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,

              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: ListOfSeach.length>0,
                  builder:(context)=> ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context,index)=> ItemNews(ListOfSeach[index],context) ,
                    separatorBuilder:(context,index)=>SizedBox(
                      height: 15,
                    ) ,
                    itemCount: ListOfSeach.length,


                  ),
                  fallback: (Context)=>Center(
                    child:ListOfSeach.length==0?Container(): CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              )


            ],
          ),
        );
      },
      listener: (context,state){},
    );
  }
}
