import 'package:flutter/material.dart';
import 'package:lifeshare/animation/FadeAnimation.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/style/theme.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeAnimation(
                1.5,
                Container(
                  height: 95.0,
                  width: 95.0,
                  child: Image.asset('assets/images/heart.png'),
                ),
              ),
              SizedBox(height: spaceM * 3),
              FadeAnimation(
                1.6,
                Row(
                  children: <Widget>[
                    Text(
                      'Donate',
                      style: kBannerTitleStyle,
                    ),
                    Text(
                      ' Plasma',
                      style: kBannerPlasmaTitleStyle,
                    )
                  ],
                ),
              ),
              FadeAnimation(
                1.6,
                Text(
                  'Save Life',
                  style: kBannerTitleStyle,
                ),
              ),
              SizedBox(
                height: spaceM + spaceS,
              ),
              FadeAnimation(
                1.7,
                Text(
                  'Recently recovered from Covid-19 ? Help others surviving by donating your plasma. Let\'s fight together to',
                  style: kBannerSubTitleStyle,
                ),
              ),
              SizedBox(
                height: spaceS,
              ),
              FadeAnimation(
                1.8,
                Text(
                  'SAVE THE WORLD',
                  style: kBannerSub02TitleStyle,
                ),
              ),
              SizedBox(
                height: spaceM * 3,
              ),
              FadeAnimation(
                1.8,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 100.0,
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(HomeScreen.routeName);
                          },
                          child: Text(
                            'Got it',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: headline6,
                                fontFamily: 'Poppins'),
                          ),
                          color: kBannerBasicColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
