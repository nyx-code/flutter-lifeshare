import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final double radius;
  final bool isMargin;
  final double padding;
  final bool outline;
  final bool swipeColor;
  const CustomButton({
    this.onPressed,
    @required this.title,
    this.outline = false,
    this.swipeColor = false,
    this.isMargin = false,
    this.radius = 10,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.all(isMargin ? 16 : 0),
          height: 54,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: !outline && !swipeColor ? kPrimaryColor : white,
              border: Border.all(
                  color: outline || swipeColor ? kPrimaryColor : white),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: Text(
            title,
            style: TextStyle(
                color: outline || swipeColor ? kPrimaryColor : black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .4),
          ),
        ),
      ),
    );
  }
}
