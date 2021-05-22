import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/constant.dart';

class StoryItem extends StatelessWidget {
  final String name, avatar, text;

  const StoryItem({
    Key key,
    @required this.name,
    @required this.avatar,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingS,
      ),
      child: Container(
        width: 180,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: spaceS),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(avatar),
              ),
            ),
            SizedBox(height: spaceS),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingM,
                ),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: spaceM),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingM,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            SizedBox(height: spaceM),
          ],
        ),
      ),
    );
  }
}
