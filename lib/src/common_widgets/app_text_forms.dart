import 'package:flutter/material.dart';
import 'package:salim_cbt/src/themes/theme.dart';

class AppTextForm {
  final TextEditingController textController;
  final String hintText;
  IconData suffixIcon;
  Color suffixColor;
  bool isPassword;
  VoidCallback? suffixFunction;

  String? Function(String?)? validator;
  AppTextForm(
    this.textController,
    this.hintText,
    this.validator, {
    this.suffixIcon = Icons.done,
    this.suffixFunction,
    this.suffixColor = Colors.green,
    this.isPassword = false,
  });

  Widget inputDecoration() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextFormField(
        obscureText: isPassword,
        validator: validator,
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: suffixFunction,
            child: Icon(
              suffixIcon,
              color: suffixColor,
            ),
          ),
          filled: true,
          fillColor: Color(0xffF2F3F7),
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xffA1A4B2)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
