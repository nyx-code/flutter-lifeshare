import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/injection.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/screens/signup/signup_screen/AddressInformation.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/DonorReceiverButton.dart';

class AccountType extends StatefulWidget {
  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Account Type',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingL,
          vertical: paddingL,
        ),
        height: 260,
        margin: EdgeInsets.symmetric(horizontal: paddingM, vertical: paddingL),
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
        child: Column(
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
                getIt<UserDynamicData>().addAccountType(type: type);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddressInformation()));
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
                getIt<UserDynamicData>().addAccountType(type: type);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddressInformation()));
              },
              adType: type,
              type: 'Reciever',
              text: 'Reciever',
            ),
          ],
        ),
      ),
    );
  }
}
