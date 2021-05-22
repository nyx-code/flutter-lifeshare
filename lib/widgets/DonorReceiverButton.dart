import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';

class DonorReceiverButton extends StatelessWidget {
  final Function onPress;
  final String adType;
  final String type;
  final IconData icon;
  final double fontSize;
  final String text;
  final int padding;
  const DonorReceiverButton(
      {@required this.onPress,
      @required this.adType,
      @required this.type,
      this.icon,
      this.padding = 14,
      this.fontSize,
      this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: adType == type ? kPrimaryColor : white,
            borderRadius: BorderRadius.circular(6),
            border: adType != type
                ? Border.all(width: .8, color: Colors.black.withOpacity(.4))
                : null),
        padding: EdgeInsets.all(padding.toDouble()),
        margin: EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  color: adType == type ? black : black,
                  size: 20,
                ),
              ),
            Text(text,
                style: TextStyle(
                    color: adType == type ? black : black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
