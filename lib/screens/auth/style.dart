import 'package:flutter/material.dart';

authDecorationInput({text}) => InputDecoration(
    hintText: text,
    filled: true,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue[200]!, width: 2.0)));
