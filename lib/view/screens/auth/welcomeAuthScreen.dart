// ignore_for_file: file_names, unused_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:mybuisness/main.dart';
import 'package:mybuisness/services/authservices.dart';
import 'package:mybuisness/view/screens/auth/login.dart';
import 'package:mybuisness/view/screens/auth/register.dart';
import 'package:mybuisness/view/widgets/buttons.dart';
import 'package:provider/provider.dart';

class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthServices authServices = AuthServices();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyBuisness',
          style: TextStyle(
            fontSize: 21.5,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.center,
                    child: null,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello! Let\'s start',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Text(
                        '''
To start in Alex community ..
You must create a new account or to sign in to your old account then enjoy the nice performance.
''',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyOutlinedButton(
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        },
                        outlinedColor: Colors.white,
                        color: mainColor,
                        widget: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      MyButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ));
                        },
                        color: Colors.white,
                        widget: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
