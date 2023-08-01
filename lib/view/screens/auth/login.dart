// ignore_for_file: file_names, unused_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, unnecessary_null_comparison, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybuisness/main.dart';
import 'package:mybuisness/services/authservices.dart';
import 'package:mybuisness/view/viewcontroller.dart';
import 'package:mybuisness/view/widgets/textfields.dart';
import '../../widgets/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 27.5,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.center,
                    child: null,
                  ),
                ),
              ),
              Expanded(
                flex: 13,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hello Back!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                          color: mainColor,
                        ),
                      ),
                      CustomAuthTextFormField(
                          tController: authServices.signInEmailController,
                          isObscure: false,
                          hint: 'write your E-mail',
                          textInputType: TextInputType.emailAddress),
                      CustomAuthTextFormField(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      authServices.isObscure =
                                          !authServices.isObscure!;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: mainColor,
                                  )),
                            ),
                          ),
                          isObscure: authServices.isObscure!,
                          tController: authServices.signInPswrdController,
                          hint: 'your secure password',
                          textInputType: TextInputType.name),
                      MyOutlinedButton(
                        onPressed: () async {
                          if ((authServices.signInEmailController!.text == '' ||
                              authServices.signInEmailController!.text ==
                                  null)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Signin Error, Write the email'),
                              duration: Duration(seconds: 2),
                            ));
                          } else if ((authServices
                                      .signInPswrdController!.text ==
                                  '' ||
                              authServices.signInPswrdController!.text ==
                                  null)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Signin Error, Write the password'),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            var response =
                                await authServices.signInMethod(context);
                            if (response != null) {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return ViewController();
                                },
                              ), (route) => false);
                            }
                            print(authServices.signUpEmailController!.text);
                            print(authServices.signUpPswrdController!.text);
                          }
                        },
                        outlinedColor: Colors.white,
                        color: mainColor,
                        widget: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(125),
                        topRight: Radius.circular(125),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
