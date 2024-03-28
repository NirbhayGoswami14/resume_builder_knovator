import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

class TextFiledDecoration
{
  static InputDecoration decoration(String hint) {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),hintStyle:TextStyles.normal14);
  }
}