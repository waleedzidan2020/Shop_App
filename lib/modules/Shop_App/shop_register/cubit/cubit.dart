


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/Shop_App/shop_register/cubit/States.dart';
import 'package:my_app/shared/components/constants.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

import '../../../../models/shop_register/shop_register.dart';

class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit () : super(RegsiterInitState());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  RegisterModel? registermodel;
 bool  IsHide =true;
 IconData? HideIcon=Icons.remove_red_eye;
 void ChangeHidePassword(IsHide){

   this.IsHide =! IsHide;
   HideIcon = this.IsHide? Icons.remove_red_eye:Icons.remove_red_eye_outlined;

   emit(ChangeHidePasswordState());

 }

 void PostData(@required String? email,
     @required String? password,
     @required String? phone,
     @required String? name){


   DioHelper.PostNewData(url: Register, email: email, password: password, phone: phone, name: name).then((value){
     registermodel=RegisterModel.FormJason(value.data);
     print(registermodel?.message);
     emit(DataRegisterSuccessState());

   }).catchError((erorr){
     print(erorr.toString());
  emit(DataRegisterErorrState());
   });

 }
}