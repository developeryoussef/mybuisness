// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, sort_child_properties_last, unnecessary_import, avoid_web_libraries_in_flutter, unused_import, prefer_typing_uninitialized_variables, unused_local_variable, depend_on_referenced_packages, prefer_interpolation_to_compose_strings, await_only_futures, body_might_complete_normally_nullable, unnecessary_null_comparison, use_build_context_synchronously, unused_element

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybuisness/view/viewcontroller.dart';

class AuthServices {
  bool? isObscure = true;
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  FirebaseFirestore? myDb = FirebaseFirestore.instance;
  TextEditingController? signUpUsrnController = TextEditingController();
  TextEditingController? signUpEmailController = TextEditingController();
  TextEditingController? signUpPswrdController = TextEditingController();
  TextEditingController? signInEmailController = TextEditingController();
  TextEditingController? signInPswrdController = TextEditingController();
  File? file;
  var imageurl;

  Future<UserCredential?> signInMethod(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInEmailController!.text.trim(),
        password: signInPswrdController!.text.trim(),
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
  }

  Future<UserCredential?>? signIn(BuildContext context) async {
    var response = await signInMethod(context);
    if (response != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return ViewController();
        },
      ));
    }
  }

  Future<UserCredential?> signUpMethod(BuildContext context) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmailController!.text,
        password: signUpEmailController!.text,
      );
      print(signUpEmailController!.text.toString());
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Future<void> _dialogBuilder(BuildContext context) {
          return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('MyBuisness'),
                content: const Text(
                  'Your password is weak\n'
                  'Try new pasword',
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Disable'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Enable'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }

        _dialogBuilder(context);
      } else if (e.code == 'email-already-in-use') {
        Future<void> _dialogBuilder(BuildContext context) {
          return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('MyBuisness'),
                content: const Text(
                  'This email is already in used'
                  'Try new email',
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Disable'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Enable'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }

        _dialogBuilder(context);

        await myDb!
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .set({
          'profilePhoto': imageurl.toString(),
        });
      }
    }
  }
}
