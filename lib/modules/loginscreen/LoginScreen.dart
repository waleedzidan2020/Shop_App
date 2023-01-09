import 'package:flutter/material.dart';
import 'package:my_app/modules/bmicalculator/BmiCal.dart';
import 'package:my_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController EmailText = TextEditingController();
  TextEditingController PasswordText = TextEditingController();
  bool IsHide = false;
  final regs = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var keyValid = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: keyValid,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: EmailText,
                      validator: (value) {
                        if (!regs.hasMatch(value.toString())) {
                          return "A7A mtsb4 el 5ara fade ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Email Adress",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Textfield(
                    valid: (value) {},
                    Label: "Password",
                    HidePass: IsHide,
                    KeyboardType: TextInputType.phone,
                    prefixIcons: Icon(
                      Icons.password,
                    ),
                    suffixIcons: IconButton(
                      icon: IsHide == true
                          ? Icon(
                              Icons.remove_red_eye,
                            )
                          : Icon(
                              Icons.panorama_fish_eye,
                            ),
                      onPressed: () {
                        setState(() {
                          IsHide = !IsHide;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  LogInButton(
                    width: double.infinity,
                    fun: () {
                      if (keyValid.currentState?.validate() == true) {
                        var arr = EmailText.text.split("@");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BmiCalc(
                                  UserName: arr[0],

                                    )));
                      }
                    },
                    colorbutton: Colors.black,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don\'t Have An Account ?",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Register",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   TextEditingController EmailText = TextEditingController();
//   TextEditingController PasswordText = TextEditingController();
//   bool IsHide = true;
//   final regs = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//   var keyValid = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar: AppBar(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Form(
//               key: keyValid,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Login",
//                     style: TextStyle(
//                       fontSize: 40.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       controller: EmailText,
//                       validator: (value) {
//                         if (!regs.hasMatch(value.toString())) {
//                           return "A7A mtsb4 el 5ara fade ";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Email Adress",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       controller: PasswordText,
//                       validator: (value) {
//                         if (value == "") {
//                           return "El pass ya 5ara  ";
//                         } else {
//                           return null;
//                         }
//                       },
//                       keyboardType: TextInputType.phone,
//                       onFieldSubmitted: (vlaue) {
//                         print(vlaue);
//                       },
//                       decoration: InputDecoration(
//                           labelText: "Password",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0)),
//                           prefixIcon: Icon(
//                             Icons.lock,
//                             color: Colors.black,
//                           ),
//                           suffixIcon: IconButton(
//                             onPressed: (){
//                               if(IsHide==true){
//                                 IsHide=false;
//                               }else {IsHide=true;}
//
//                             },
//                             icon: Icon(
//                               Icons.remove_red_eye,
//                               color: Colors.black,
//                             ),
//                           )),
//                       obscureText: IsHide,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 7.0,
//                   ),
//                   LogInButton(
//                     width: double.infinity,
//                     fun: () {
//                       if (keyValid.currentState?.validate() == true) {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => BmiCalc()));
//                       }
//                     },
//                     colorbutton: Colors.black,
//                   ),
//                   SizedBox(
//                     height: 7.0,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Don\'t Have An Account ?",
//                           style: TextStyle(fontSize: 15.0),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             "Register",
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
