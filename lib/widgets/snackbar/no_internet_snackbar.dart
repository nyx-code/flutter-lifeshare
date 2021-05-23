import 'package:flutter/material.dart';

import '../../constant.dart';

Widget noInternetSnackBar(
    {@required Function onRefresh,
    String title = 'Please check your Internet connection  message'}) {
  return SnackBar(
    behavior: SnackBarBehavior.fixed,
    content: Text(
      title,
      style: TextStyle(fontSize: 14),
    ),
    action: SnackBarAction(
        textColor: kPrimaryColor, label: 'RETRY', onPressed: onRefresh),
    backgroundColor: black,
    duration: Duration(seconds: 100),
  );
}
