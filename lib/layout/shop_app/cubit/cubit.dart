import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/shop_app/cubit/state.dart';
import 'package:my_app/models/shop_categories/Categorise_model.dart';
import 'package:my_app/models/shop_profile/shop_profile.dart';
import 'package:my_app/modules/Shop_App/categories_screen/Categorise_Screen.dart';
import 'package:my_app/modules/Shop_App/favorite_screen/Favorite_Screen.dart';
import 'package:my_app/modules/Shop_App/product_screen/Product_Screen.dart';
import 'package:my_app/modules/Shop_App/settings_screen/Setting_Screen.dart';
import 'package:my_app/shared/network/local/cashe_helper.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

import '../../../models/shop_favorite/GetFavorite.dart';
import '../../../models/shop_favorite/changefavorite.dart';
import '../../../models/shop_product/Product_model.dart';
import '../../../modules/Shop_App/shop_login/Shop_LogIn.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';

class ShopLayoutCubit extends Cubit<ShopStates> {
  ShopLayoutCubit() : super(ShopInitialState());

  static ShopLayoutCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;
  profileModel? profileinfo;

  ProductModel? Productmodel;
  CategoriseModel? CategoryModel;
  Map<int, bool> Favorite = {};
  ChangeFavoriteModel? FavoriteChange;
  FavoriteModel? favoritedata;

  List<Widget> BottomScreens = [
    ProductScreen(),
    CategoriseScreen(),
    FavoriteScreen(),
    SettingScreen()
  ];
  List<BottomNavigationBarItem> ListOfBottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.production_quantity_limits),
      label: "Products",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: "Category",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: "Favorite",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  void ChangeBottomNaviate(int index) {
    emit(LoadingBottomState());
    CurrentIndex = index;
    emit(ChangeBottomNavigateState());
  }


  void AddFavorite(int ProductId) {
    Favorite[ProductId] = !Favorite[ProductId]!;
    emit(ChangeFavoriteState());
    DioHelper.PostFavorites(
            url: Favorites, Token: IsToken, ProductId: ProductId)
        .then((value) {
      print(value.data.toString());

      FavoriteChange = ChangeFavoriteModel.FromJason(value.data);
      if (FavoriteChange?.status == false) {
        Favorite[ProductId] = !Favorite[ProductId]!;
      } else {
        GetFavorites();
      }
      emit(PostFavoriteSuccessState());
    }).catchError((error) {
      print(error);
      Favorite[ProductId] = !Favorite[ProductId]!;
      emit(PostFavoriteErorrState());
    });
  }

  void GetFavorites() {
    emit(LoadingFavoritePageState());
    DioHelper.GetData(url: Favorites, token: IsToken).then((value) {
      favoritedata = FavoriteModel.FromJason(value.data);
      print(favoritedata?.data?.data[0].product?.image);
      emit(GetFavoriteSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(GetFavoriteErorrState());
    });
  }

  void GetDataProduct() {
    emit(DataLoadingState());
    DioHelper.GetData(url: Home, token: IsToken).then((value) {
      Productmodel = ProductModel.FromJason(value.data);
      Productmodel!.data!.ListOfProducts.forEach((element) {
        Favorite.addAll({element.id: element.Infavorites});
      });



      print(IsToken);

      emit(DataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DataErorrState());
    });
  }

  void GetDataCategory() {
    emit(DataCategoryLoadingState());
    DioHelper.GetData(url: category).then((value) {
      CategoryModel = CategoriseModel.FromJason(value.data);

      emit(DataCategorySuccessState());
    }).catchError((error) {
      print(error);
      emit(DataCategoryErrorState());
    });
  }

  void UpdateProfile(
      @required String? name,
      @required String? phone,
      @required String? email,
      ) {
    emit(LoadingUpdateState());
    DioHelper.PutData(
        url: updateprofile,
        name: name,
        phone: phone,
        email: email,
        token: IsToken)
        .then((value) {
      GetProfile();
      emit(updateSuccessState());
    }).catchError((error) {
      emit(updateErorrState());
    });
  }

  void GetProfile() {
    emit(ProfileLoadingState(profileinfo));
    DioHelper.GetData(url: Profile, token: IsToken).then((value) {
      profileinfo = profileModel.FormJason(value.data);
      print(profileinfo!.status);
      emit(ProfileDataSuccessState(profileinfo));
    }).catchError((Error) {
      print(Error.toString());
      emit(ProfileDataErorrState());
    });
  }

  void PostToken() {
    DioHelper.Removetoken(url: LogOut, token: IsToken).then((Value) {
      print(Value.toString());
      emit(removetoken());
    });
  }
}
