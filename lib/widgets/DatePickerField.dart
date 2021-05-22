import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/constant.dart';

class DatePickerField extends StatelessWidget {
  final Function() onTap;
  final String selectedDate;

  const DatePickerField({Key key, this.onTap, this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: kPrimaryColor)),
        width: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              selectedDate,
              style: TextStyle(fontSize: 18),
            ),
            FaIcon(
              FontAwesomeIcons.calendar,
              color: kPrimaryColor,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
