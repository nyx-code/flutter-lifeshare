import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/screens/dashboard_screens/widgets/PostCard.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nearlyWhite,
      body: Column(
        children: [
          SizedBox(
            height: spaceM,
          ),
          PostCard(
            name: "Shailesh Kadam",
            avatar:
                "https://www.hostpapa.hk/knowledgebase/wp-content/uploads/2018/04/1-13.png",
            location: "Pune",
            bloodtype: "O",
            phonenumber: "+918446842249",
          ),
          PostCard(
            name: "Shailesh Kadam",
            avatar:
                "https://www.hostpapa.hk/knowledgebase/wp-content/uploads/2018/04/1-13.png",
            location: "Pune",
            bloodtype: "O",
            phonenumber: "+918446842249",
          ),
          PostCard(
            name: "Shailesh Kadam",
            avatar:
                "https://www.hostpapa.hk/knowledgebase/wp-content/uploads/2018/04/1-13.png",
            location: "Pune",
            bloodtype: "O",
            phonenumber: "+918446842249",
          ),
        ],
      ),
    );
  }
}
