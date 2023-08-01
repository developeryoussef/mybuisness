// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.5),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 65),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 230, 230, 230),
        ),
        child: TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            prefixIconColor: Colors.black,
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: InputBorder.none,
            hintText: 'cat',
          ),
        ),
      ),
    );
  }
}

class CustomAuthTextFormField extends StatefulWidget {
  final TextInputType? textInputType;
  final bool? isObscure;
  final void Function()? iconp;
  final Widget? suffixIcon;
  final String? hint;
  final TextEditingController? tController;
  const CustomAuthTextFormField(
      {this.tController,
      this.iconp,
      this.suffixIcon,
      this.isObscure,
      this.hint,
      this.textInputType});

  @override
  State<CustomAuthTextFormField> createState() =>
      _CustomAuthTextFormFieldState();
}

class _CustomAuthTextFormFieldState extends State<CustomAuthTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              height: 60,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5, color: Colors.black.withOpacity(0.2)),
                ],
              ),
              child: Expanded(
                flex: 6,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  obscureText: widget.isObscure!,
                  controller: widget.tController,
                  keyboardType: widget.textInputType,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 15),
                      hintText: widget.hint,
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(height: 1, color: Colors.grey.shade600)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
