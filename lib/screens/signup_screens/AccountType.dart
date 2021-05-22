import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/DonorReceiverButton.dart';

class AccountType extends StatefulWidget {
  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  String type = "Donor";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Select Account Type",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: spaceM),
        DonorReceiverButton(
          fontSize: 18,
          padding: 18,
          onPress: () {
            setState(() {
              type = "Donor";
            });
          },
          adType: type,
          type: 'Donor',
          text: 'Donor',
        ),
        SizedBox(height: 20),
        DonorReceiverButton(
          padding: 18,
          fontSize: 18,
          onPress: () {
            setState(() {
              type = "Reciever";
            });
          },
          adType: type,
          type: 'Reciever',
          text: 'Reciever',
        ),
      ],
    );
  }
}
