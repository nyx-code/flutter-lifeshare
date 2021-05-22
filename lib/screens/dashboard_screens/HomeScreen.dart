import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/InformationCard.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/PostItem.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/StoryItem.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nearlyWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: spaceM * 2,
                  ),
                  child: Row(
                    children: [
                      InformationCard(
                        text: "Keep Social Distance when you are outside.",
                      ),
                      InformationCard(
                        text:
                            "Use hand sanatizer, mask and gloves to protect yourself.",
                      ),
                      InformationCard(
                        text: "Keep Social Distance when you are outside.",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: spaceM,
              ),
              Text(
                "Recent Donors",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: spaceS,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: spaceM,
                  ),
                  child: Row(
                    children: [
                      PostItem(
                        name: "Shailesh Kadam",
                        avatar:
                            "https://gravatar.com/avatar/0f43050cb55784114a0810fa874e0a5b?d=mm&r=pg&s=200",
                        location: "Pune",
                        bloodtype: "O",
                        phonenumber: "+918446842249",
                      ),
                      PostItem(
                        name: "Tasmiya Kankurti",
                        avatar:
                            "https://gravatar.com/avatar/0f43050cb55784114a0810fa874e0a5b?d=mm&r=pg&s=200",
                        location: "Solapur",
                        bloodtype: "O",
                        phonenumber: "+918446842249",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: spaceM,
              ),
              Text(
                "Recent Request",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: spaceS,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: spaceM,
                  ),
                  child: Row(
                    children: [
                      PostItem(
                        name: "Shailesh Kadam",
                        avatar:
                            "https://gravatar.com/avatar/0f43050cb55784114a0810fa874e0a5b?d=mm&r=pg&s=200",
                        location: "Pune",
                        bloodtype: "O",
                        phonenumber: "+918446842249",
                      ),
                      PostItem(
                        name: "Tasmiya Kankurti",
                        avatar:
                            "https://gravatar.com/avatar/0f43050cb55784114a0810fa874e0a5b?d=mm&r=pg&s=200",
                        location: "Solapur",
                        bloodtype: "O",
                        phonenumber: "+918446842249",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: spaceM,
              ),
              Text(
                "Stories shared by Covid Fighters",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: spaceS,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: spaceM,
                  ),
                  child: Row(
                    children: [
                      StoryItem(
                        name: "Shailesh Kadam",
                        avatar:
                            "https://gravatar.com/avatar/0f43050cb55784114a0810fa874e0a5b?d=mm&r=pg&s=200",
                        text:
                            "Hello guys my name is Shailesh Kadamkasnckan kas ckac ancoascoanscias ciaicnasics",
                      ),
                      StoryItem(
                        name: "Shailesh Kadam",
                        avatar:
                            "https://gravatar.com/avatar/0f43050cb55784114a0810fa874e0a5b?d=mm&r=pg&s=200",
                        text:
                            "Hello guys my name is Shailesh Kadamkasnckan kas ckac ancoascoanscias ciaicnasics",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
