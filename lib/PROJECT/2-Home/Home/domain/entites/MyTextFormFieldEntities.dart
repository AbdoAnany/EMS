//@dart=2.9
import 'package:flutter/material.dart';

class MyTextFormFieldEntities {
  final String label;
  final String hint;
  FocusNode focusNode;
  IconData icon;
  TextEditingController controller;
  final TextInputType keyboardType;
  MyTextFormFieldEntities(
      {this.label,
      this.hint,
      this.icon,
      this.focusNode,
      this.controller,
      this.keyboardType});
}
