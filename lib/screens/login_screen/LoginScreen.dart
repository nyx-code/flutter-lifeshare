import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/auth/auth_cubit.dart';
import 'package:lifeshare/bloc/login/login_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/screens/main_screen/main_screen.dart';
import 'package:lifeshare/screens/signup/SignupScreen.dart';
import 'package:lifeshare/screens/signup/signup_screen/AccountType.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/TextFields/EmailTextField.dart';
import 'package:lifeshare/widgets/TextFields/PasswordTextField.dart';
import 'package:lifeshare/widgets/footer/footer.dart';
import 'package:lifeshare/widgets/loading.dart';

import '../DashboardScreens.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _enable = false;
  String _userType = "Donor";
  TextEditingController _emailController;
  TextEditingController _passwordController;

  _onPress() {
    if (_formKey.currentState.validate()) {
      if (_userType == "Donor") {
        BlocProvider.of<LoginCubit>(context).donorLogin(
            email: _emailController.text, password: _passwordController.text);
      } else {
        BlocProvider.of<LoginCubit>(context).recieverLogin(
            email: _emailController.text, password: _passwordController.text);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'shailesh@gmail.com');
    _passwordController = TextEditingController(text: '123');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccess) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainScreen()),
            (Route<dynamic> route) => false);
      }
    }, builder: (context, state) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: nearlyWhite,
              child: Column(
                children: [
                  SizedBox(height: spaceM * 3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingM),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingM,
                      ),
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: spaceM + spaceS,
                            ),
                            EmailTextField(
                              controller: _emailController,
                              validate: true,
                            ),
                            PasswordTextField(_passwordController),
                            CustomDropDown(
                              title: "Account Type",
                              data: ["Donor", "Reciever"],
                              selectedDropdownValue: _userType,
                              onChanged: (value) {
                                setState(() {
                                  _userType = value;
                                });
                              },
                            ),
                            CustomButton(
                              title: 'LOGIN',
                              onPressed: _onPress,
                            ),
                            SizedBox(
                              height: spaceM + spaceS,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: spaceM),
                  Footer(
                    firstText: "Don't have an account",
                    secondText: 'Register',
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AccountType()),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          if (state is LoginLoading) Loading()
        ],
      );
    });
  }
}
