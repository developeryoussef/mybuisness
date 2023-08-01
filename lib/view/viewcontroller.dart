// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mybuisness/main.dart';
import 'package:mybuisness/view/screens/notespage.dart';

class ViewController extends StatefulWidget {
  const ViewController({super.key});

  @override
  State<ViewController> createState() => _ViewControllerState();
}

class _ViewControllerState extends State<ViewController> {
  int index = 0;
  final pages = [NotesPage(), NotesPage(), NotesPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: mainColor,
        onTap: (index) => setState(() => this.index = index),
        currentIndex: index,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(label: 'notes', icon: Icon(Icons.note)),
          BottomNavigationBarItem(
              label: 'todo', icon: Icon(Icons.today_outlined)),
          BottomNavigationBarItem(
              label: 'finance', icon: Icon(Icons.attach_money_outlined)),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(),
        elevation: 0,
        title: Text(
          'My Buisness',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: pages[index],
    );
  }
}
