import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/mainscreen/mainscreen.dart';
import 'package:my_app/layout/news_app/cubit/cubit.dart';
import 'package:my_app/layout/news_app/cubit/states.dart';
import 'package:my_app/layout/shop_app/cubit/cubit.dart';
import 'package:my_app/modules/Shop_App/shop_login/Shop_LogIn.dart';
import 'package:my_app/modules/counterscreen/CounterScreen.dart';
import 'package:my_app/modules/loginscreen/LoginScreen.dart';

import 'package:my_app/modules/phonelist/Phone_number.dart';
import 'package:my_app/shared/components/constants.dart';
import 'package:my_app/shared/network/local/bloc_observer.dart';
import 'package:my_app/shared/network/local/cashe_helper.dart';
import 'package:my_app/shared/network/remote/dio_helper.dart';

import 'layout/news_app/news_app.dart';
import 'layout/shop_app/shop_app.dart';
import 'modules/Shop_App/onboarding_screen/OnBoardingScreen.dart';
import 'modules/Shop_App/shop_login/cubit/cubit.dart';
import 'modules/bmicalculator/BmiCal.dart';
import 'modules/firstscreen/First_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.Init();

 IsBoarding = await CacheHelper.GetData("Onboarding");


  IsToken = await CacheHelper.GetData("token");

  if (IsBoarding == true) {
    if (IsToken != null) {
      BaseScreen = ShopHomeScreen();
    } else {
      BaseScreen = ShopLogInScreen();
    }
  } else {
    BaseScreen = onboarding_screen();
  }


  runApp(Home(IsBoarding, BaseScreen));
}

class Home extends StatelessWidget {
  bool? isboarding;
  Widget? basescreen;

  Home(bool? isboarding, Widget? basescreen) {
    this.isboarding = isboarding;
    this.basescreen = basescreen;
  }

  @override
  Widget build(BuildContext context) {




    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit(),
        ),
        BlocProvider(
          create: (context) => ShopLayoutCubit()
            ..GetDataProduct()
            ..GetDataCategory()
            ..GetFavorites()..GetProfile(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopLoginCubit(),
        )
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightTheme,
            darkTheme: DarkTheme,
            themeMode: cubit.IsDark ? ThemeMode.dark : ThemeMode.light,
            home: basescreen,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
