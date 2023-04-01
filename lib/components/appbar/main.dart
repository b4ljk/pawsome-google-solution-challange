import 'package:flutter/material.dart';
import 'package:pawsome/main.dart';
import 'package:pawsome/pawsome/theming.dart';

PreferredSizeWidget customAppbar(
  String title,
  BuildContext context,
) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(24),
      ),
    ),
    centerTitle: true,
    backgroundColor: HexColor("#6A88E5"),
    elevation: 0.0,
  );
}
