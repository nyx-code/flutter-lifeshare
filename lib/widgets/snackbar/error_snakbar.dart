import 'package:flutter/material.dart';

Widget errorSnackBar({@required String title}) {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Expanded(child: Text(title)), Icon(Icons.error)],
    ),
    duration: Duration(milliseconds: 1000),
    backgroundColor: Colors.red,
  );
}
