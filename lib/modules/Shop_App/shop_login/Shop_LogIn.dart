import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/modules/Shop_App/shop_login/cubit/cubit.dart';
import 'package:my_app/modules/Shop_App/shop_login/cubit/state.dart';
import 'package:my_app/shared/components/components.dart';
import 'package:my_app/shared/components/constants.dart';
import 'package:my_app/shared/components/constants.dart';
import 'package:my_app/shared/network/local/cashe_helper.dart';

import '../../../layout/shop_app/shop_app.dart';

import '../shop_register/Shop_Register.dart';

class ShopLogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var PasswordController = TextEditingController();

    final regs = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    GlobalKey<FormState> FormKey = GlobalKey<FormState>();
    return BlocConsumer<ShopLoginCubit, ShopLogInStates>(
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          if(state is DataSuccessLoginState){
            IsToken=state.LoginModel?.data?.token;
          }
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: FormKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LogIn",
                          style: TextStyle(
                            fontFamily: "Oswald",
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Please Enter your personal info",
                          style: TextStyle(
                            fontFamily: "",
                            fontSize: 20,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Textfield(
                          padding: 0.0,
                          Label: "Enter Your Email",
                          valid: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Email";
                            } else {
                              if (regs.hasMatch(emailcontroller.text)) {
                                return null;
                              } else {
                                return "Add  ***@***.com ";
                              }
                            }
                          },
                          ontap: () {},
                          Onsubmitted: (value) {
                            if (FormKey.currentState!.validate()) {}
                          },
                          passwordtext: emailcontroller,
                          prefixIcons: Icon(
                            Icons.email_outlined,
                          ),
                          KeyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Textfield(
                          padding: 0.0,
                          Label: "Enter Your Password",
                          HidePass: cubit.IsVisible,
                          valid: (String? value) {
                            if (!value!.isEmpty) {
                              if (value!.length <= 12) {
                                return null;
                              } else {
                                return "Max 12 number";
                              }
                            } else {
                              return "must enter your password";
                            }
                          },
                          ontap: () {},
                          Onsubmitted: (value) {
                            if (FormKey.currentState!.validate()) {}
                          },
                          passwordtext: PasswordController,
                          prefixIcons: Icon(
                            Icons.lock_clock_rounded,
                          ),
                          suffixIcons: IconButton(
                            onPressed: () {
                              cubit.ChangeVisiblePassword();
                            },
                            icon: Icon(
                              cubit.EyeIcon,
                            ),
                          ),
                          KeyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        ConditionalBuilder(
                          condition: state is! DataLoginLoadingState,
                          builder: (context) => LogInButton(
                            width: double.infinity,
                            TextButton: "Login",
                            fun: () {
                              if (FormKey.currentState!.validate()) {
                                if (regs.hasMatch(emailcontroller.text)) {
                                  cubit.UserLogin(emailcontroller.text,
                                      PasswordController.text);

                                } else {}
                              }
                            },
                            horizontalPadding: 0.0,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don\'t Have An Account ?",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigateto(context, ShopRegisterScreen());
                              },
                              child: Text(
                                "Register",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state)async {
          var cubit = ShopLoginCubit.get(context);
          if (state is DataSuccessLoginState) {
            if (state.LoginModel!.status == true) {
              CacheHelper.SaveData("token", state.LoginModel?.data?.token)
                  .then((value) {

                NaviatAndPush(context, ShopHomeScreen());
                print(value);
              });



              IsToken = state.LoginModel?.data?.token;
              Islogin=true;


              // Fluttertoast.showToast(
              //     msg: '${state.LoginModel!.message}',
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.BOTTOM,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.green,
              //     textColor: Colors.white,
              //     fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: '${state.LoginModel!.message}',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
      );

  }
}
