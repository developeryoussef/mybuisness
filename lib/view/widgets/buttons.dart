// ignore_for_file: file_names, unused_import, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color outlinedColor;
  final Color color;
  final Widget widget;
  const MyOutlinedButton(
      {required this.onPressed,
      required this.outlinedColor,
      required this.color,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(3),
        height: 60,
        decoration: BoxDecoration(
          color: outlinedColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
            child: widget,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final Widget widget;
  const MyButton(
      {required this.onPressed, required this.color, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          height: 60,
          child: widget,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
    );
  }
}
