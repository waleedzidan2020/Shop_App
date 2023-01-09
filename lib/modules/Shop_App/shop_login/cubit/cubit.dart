import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/shop_login/shop_login.dart';
import 'package:my_app/modules/Shop_App/shop_login/cubit/state.dart';
import 'package:my_app/shared/components/constants.dart';
import 'package:my_app/shared/network/local/cashe_helper.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLogInStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);


  bool IsVisible = true;
  IconData EyeIcon = Icons.remove_red_eye;

  void ChangeVisiblePassword() {
    IsVisible = !IsVisible;
    EyeIcon =
        IsVisible ? Icons.remove_red_eye : Icons.disabled_visible_outlined;
    emit(PasswordVisibleState());
  }

  void UserLogin(
    @required String? email,
    @required String? password,
  ) {
    emit(DataLoginLoadingState());
    DioHelper.PostData(url: LoginPath, email: email, password: password).then(
      (value) {
        LoginModel = new ShopLoginModel.FromJason(value.data);


        print(value.data.toString());

        emit(DataSuccessLoginState(LoginModel));
      },
    ).catchError((error) {
      print(error);
      emit(DataErrorState());
    });
  }
}
