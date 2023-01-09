import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/counterscreen/cubit/cubit.dart';
import 'package:my_app/modules/counterscreen/cubit/states.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        builder:(context,state)=> Scaffold(
          appBar: AppBar(
            title: Text(
              "Counter",
            ),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    CounterCubit.get(context).plus();
                  },
                  child: Text(
                    "Plus",
                    style: TextStyle(
                      fontSize: 20,
                    ),

                  ),
                ),
                Text(
                  "${CounterCubit.get(context).counter}",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                TextButton(
                  onPressed: () {
                 CounterCubit.get(context).Minus();
                  },
                  child: Text(
                    "Minus",
                    style: TextStyle(
                      fontSize: 20,
                    ),

                  ),
                ),
                TextButton(
                  onPressed: () {
                  CounterCubit.get(context).reset();
                  },
                  child: Text(
                    "ReSet",
                    style: TextStyle(
                      fontSize: 20,
                    ),

                  ),
                )
              ],
            ),
          ),
        ) ,
        listener:(context, state){

        } ,

      ),
    );
  }
}


