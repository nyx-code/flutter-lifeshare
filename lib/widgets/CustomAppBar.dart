import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends PreferredSize {
  final String title;
  final double height;
  final List<Widget> actions;
  final bool centerTitle;
  final PreferredSizeWidget bottom;
  final double elevation;
  final bool isleading;
  final Function onPress;
  const CustomAppBar(
      {this.onPress,
      this.isleading = false,
      this.elevation,
      this.bottom,
      this.centerTitle = true,
      this.height = kToolbarHeight,
      @required this.title,
      this.actions});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: kPrimaryColor,
      leading: isleading
          ? IconButton(icon: Icon(MdiIcons.menu), onPressed: onPress)
          : null,
      centerTitle: centerTitle,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: TextStyle(
              fontSize: subtitle1,
              fontWeight: FontWeight.w600,
              letterSpacing: .8),
        ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}
