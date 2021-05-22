import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';

class InformationCard extends StatelessWidget {
  final String text;

  const InformationCard({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingS,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingM,
        ),
        width: 170,
        height: 120,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
