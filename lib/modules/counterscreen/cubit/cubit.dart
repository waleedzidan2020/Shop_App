import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/counterscreen/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitState());

  static CounterCubit  get(context)=>BlocProvider.of(context);
  int counter =1;
  void plus() {
    counter++;
    emit(CounterPlusState(counter));

}
  void Minus() {
    counter--;
    emit(CounterMinusState());

  }
  void reset() {
    counter=0;
    emit(CounterResetState());

  }

}