import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/layout/shop_app/cubit/cubit.dart';
import 'package:my_app/layout/shop_app/cubit/state.dart';
import 'package:my_app/modules/Shop_App/shop_login/cubit/state.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cashe_helper.dart';
import '../shop_login/Shop_LogIn.dart';

class SettingScreen extends StatelessWidget {
  GlobalKey<FormState> KeyEdit = GlobalKey<FormState>();
  var EmailController = TextEditingController();
  RegExp rex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  var UserNameController = TextEditingController();
  var PhoneController = TextEditingController();

  void removetoken(context) {
    CacheHelper.RemoveToken("token").then((value) {
      if (value) {
        print("removed");
        NaviatAndPush(context, ShopLogInScreen());
        print(IsToken);
        IsToken = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopStates>(builder: (context, state) {
      var cubit = ShopLayoutCubit.get(context);
      UserNameController.text = cubit.profileinfo!.data!.UserName!;
      PhoneController.text = cubit.profileinfo!.data!.Phone!;
      EmailController.text = cubit.profileinfo!.data!.email!;

      return ConditionalBuilder(
        condition: state is ProfileLoadingState||state is ProfileDataSuccessState||state is DataSuccessState||LoginModel?.status!=null,
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: KeyEdit,
              child: Column(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Oswald',
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Textfield(
                    valid: (String? Value) {
                      if (Value!.isEmpty) {
                        return "Must Fill this Field";
                      } else {
                        return null;
                      }
                    },
                    passwordtext: UserNameController,
                    Label: "User Name",
                    padding: 0.0,
                    KeyboardType: TextInputType.text,
                    prefixIcons: Icon(
                      Icons.text_format,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Textfield(
                    valid: (String? Value) {
                      if (Value!.isEmpty) {
                        return "Must Fill this Field";
                      } else {
                        if (rex.hasMatch(Value) == true) {
                          return null;
                        } else
                          return "Add @****.***";
                      }
                    },
                    passwordtext: EmailController,
                    Label: "Email",
                    padding: 0.0,
                    KeyboardType: TextInputType.emailAddress,
                    prefixIcons: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Textfield(
                    valid: (String? Value) {
                      if (Value!.isEmpty) {
                        return "Must Fill this Field";
                      } else
                        return null;
                    },
                    passwordtext: PhoneController,
                    Label: "Phone",
                    padding: 0.0,
                    KeyboardType: TextInputType.phone,
                    prefixIcons: Icon(
                      Icons.phone,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is LoadingUpdateState ||
                        state is ProfileLoadingState,
                    builder: (context) =>
                        Center(child: CircularProgressIndicator()),
                    fallback: (context) => LogInButton(
                      width: double.infinity,
                      TextButton: 'Update',
                      horizontalPadding: 0.0,
                      fun: () {
                        cubit.UpdateProfile(UserNameController.text,
                            PhoneController.text, EmailController.text);
                      },
                    ),
                  ),
                  LogInButton(
                    width: double.infinity,
                    TextButton: 'LogOut',
                    horizontalPadding: 0.0,
                    fun: () {
                      removetoken(context);
                      cubit.PostToken();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        fallback: (context) {

          return Center(child: CircularProgressIndicator());
        },
      );
    }, listener: (context, state) {
      var cubit = ShopLayoutCubit.get(context);
      if (state is ProfileLoadingState) {
        if(state.profile?.data!=null) {
          cubit.GetProfile();
        }
      }
    });
  }
}
