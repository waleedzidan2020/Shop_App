import '../../../../models/shop_login/shop_login.dart';

abstract class ShopLogInStates {}

class ShopLoginInitialState extends ShopLogInStates {}

class PasswordVisibleState extends ShopLogInStates {}

class DataSuccessLoginState extends ShopLogInStates {
  ShopLoginModel? LoginModel;

  DataSuccessLoginState(this.LoginModel);
}

class DataErrorState extends ShopLogInStates {}

class DataLoginLoadingState extends ShopLogInStates {}
