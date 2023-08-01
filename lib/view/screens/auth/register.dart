// ignore_for_file: file_names, unused_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, unnecessary_null_comparison, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybuisness/main.dart';
import 'package:mybuisness/view/viewcontroller.dart';
import 'package:mybuisness/view/widgets/textfields.dart';
import '../../../services/authservices.dart';
import '../../widgets/buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register',
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
                        'Create account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                          color: mainColor,
                        ),
                      ),
                      CustomAuthTextFormField(
                          tController: authServices.signUpUsrnController,
                          isObscure: false,
                          hint: 'write your username',
                          textInputType: TextInputType.name),
                      CustomAuthTextFormField(
                          tController: authServices.signUpEmailController,
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
                                    color: Color.fromARGB(255, 18, 117, 156),
                                  )),
                            ),
                          ),
                          isObscure: authServices.isObscure!,
                          tController: authServices.signUpPswrdController,
                          hint: 'your secure password',
                          textInputType: TextInputType.name),
                      MyOutlinedButton(
                        onPressed: () async {
                          if ((authServices.signUpUsrnController!.text == '' ||
                              authServices.signUpUsrnController!.text ==
                                  null)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Signup Error, Write the email'),
                              duration: Duration(seconds: 2),
                            ));
                          } else if ((authServices
                                      .signUpEmailController!.text ==
                                  '' ||
                              authServices.signUpEmailController!.text ==
                                  null)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Signup Error, Write the email'),
                              duration: Duration(seconds: 2),
                            ));
                          } else if ((authServices
                                      .signUpPswrdController!.text ==
                                  '' ||
                              authServices.signUpPswrdController!.text ==
                                  null)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Signup Error, Write the email'),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            var response =
                                await authServices.signUpMethod(context);
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
