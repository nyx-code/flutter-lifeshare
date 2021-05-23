import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/login/login_cubit.dart';
import 'package:lifeshare/screens/login_screen/LoginScreen.dart';

import '../../injection.dart';
import '../../widgets/CustomAppBar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Login Screen"),
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: LoginScreen(),
      ),
    );
  }
}
