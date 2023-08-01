// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybuisness/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.5),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 25, left: 25),
                  child: Text('Search notes here'),
                  width: width(context) - 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: mainColorOpacitied,
                  ),
                )),
            SizedBox(
              height: 35,
            ),
            Expanded(
              flex: 9,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('notes')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .collection('mynotes')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    );
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: mainColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['title']),
                            Material(
                              borderRadius: BorderRadius.circular(20),
                              type: MaterialType.card,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Text(
                                  data['desc'],
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 240, 237, 230)),
                                ),
                              ),
                              color: mainColor,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
