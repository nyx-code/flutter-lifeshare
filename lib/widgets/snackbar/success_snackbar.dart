import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant.dart';

Widget successSnackBar({@required String title}) {
  return SnackBar(
    duration: Duration(milliseconds: 2000),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title)),
        const FaIcon(
          FontAwesomeIcons.checkCircle,
          color: white,
        )
      ],
    ),
    backgroundColor: Colors.green,
  );
}
