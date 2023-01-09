import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/shop_app/cubit/cubit.dart';
import 'package:my_app/layout/shop_app/cubit/state.dart';
import 'package:my_app/models/shop_login/shop_login.dart';
import 'package:my_app/modules/Shop_App/shop_login/Shop_LogIn.dart';
import 'package:my_app/shared/components/components.dart';
import 'package:my_app/shared/components/constants.dart';
import 'package:my_app/shared/network/local/cashe_helper.dart';

import '../../modules/Shop_App/shop_login/cubit/state.dart';

class ShopHomeScreen extends StatelessWidget {
  // UserLogin? User;

  // ShopHomeScreen(UserLogin? Index) {
  //   this.User = Index;
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopStates>(
        builder: (context, state) {
          var cubit = ShopLayoutCubit.get(context);
          if (Islogin == true) {
            cubit.GetProfile();
            cubit.GetDataProduct();
            cubit.GetFavorites();
            Islogin = false;
          }
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: cubit.ListOfBottomItem,
              onTap: (index) {
                cubit.ChangeBottomNaviate(index);

              },
              currentIndex: cubit.CurrentIndex,
            ),
            appBar: AppBar(
              title: Text(
                "Salla App",
                style: TextStyle(
                  fontFamily: "Oswald",
                  fontSize: 30,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "LogOut",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            body: cubit.BottomScreens[cubit.CurrentIndex],
          );
        },
        listener: (context, state) {});
  }
}
