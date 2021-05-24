import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/bloc/auth/auth_cubit.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/screens/dashboard_screens/HomeScreen.dart';
import 'package:lifeshare/screens/dashboard_screens/MyProfileScreen.dart';
import 'package:lifeshare/screens/dashboard_screens/PostScreen.dart';
import 'package:lifeshare/screens/dashboard_screens/RequestScreen.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'login_screen/Login.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  String _label = '';
  IconData _icon = FontAwesomeIcons.handHoldingWater;

  _getCurrentPage() {
    if (_currentIndex == 0) {
      return HomeScreen();
    } else if (_currentIndex == 1) {
      return PostScreen();
    } else if (_currentIndex == 3) {
      return RequestScreen();
    } else if (_currentIndex == 4) {
      return MyProfileScreen();
    } else {
      return Container();
    }
  }

  _getAppBar() {
    if (_currentIndex == 0) {
      return CustomAppBar(title: 'Home');
    } else if (_currentIndex == 1) {
      return CustomAppBar(title: 'Available Donors');
    } else if (_currentIndex == 3) {
      return CustomAppBar(title: 'Available Requests');
    } else if (_currentIndex == 4) {
      return CustomAppBar(
        title: 'My Profile',
        actions: [
          IconButton(
              icon: Icon(
                MdiIcons.logout,
                color: black,
              ),
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);
              })
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardCubit>(context).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is GetUserData) {
          final _data = state.model;
          if (_data.userType == "Donor") {
            setState(() {
              _label = "Be Donor";
              _icon = FontAwesomeIcons.handHoldingWater;
            });
          } else {
            setState(() {
              _label = "Request";
              _icon = FontAwesomeIcons.plus;
            });
          }
        }
      },
      child: Scaffold(
        appBar: _getAppBar(),
        body: _getCurrentPage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Container()));
          },
          tooltip: 'Become Donor',
          child: Icon(
            _icon,
            color: black,
            size: 24,
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              backgroundColor: white,
              currentIndex: _currentIndex,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(
                      Icons.home,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(MdiIcons.accountGroup),
                  ),
                  label: 'Donors',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(MdiIcons.circle),
                  ),
                  label: _label,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(MdiIcons.accountMultiplePlus),
                  ),
                  label: 'Requests',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(MdiIcons.account),
                  ),
                  label: 'My Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
