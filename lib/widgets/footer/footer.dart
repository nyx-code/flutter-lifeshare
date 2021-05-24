import 'package:flutter/material.dart';

import '../../constant.dart';

class Footer extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Function onPress;

  const Footer(
      {@required this.firstText,
      @required this.secondText,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "$firstText ?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(secondText,
              style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
