import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/auth/auth_cubit.dart';
import 'package:lifeshare/bloc/login/login_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/injection.dart';
import 'package:lifeshare/screens/DashboardScreens.dart';
import 'package:lifeshare/screens/login_screen/Login.dart';
import 'package:lifeshare/screens/login_screen/LoginScreen.dart';
import 'package:lifeshare/screens/main_screen/main_screen.dart';
import 'package:lifeshare/screens/splash_screen/splash_screen.dart';
import 'package:lifeshare/style/theme.dart';
import 'package:lifeshare/widgets/loading.dart';

import 'screens/login_screen/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(BlocProvider<AuthCubit>(
    create: (context) => getIt<AuthCubit>()..appStarted(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFCBC04, getSwatch(kPrimaryColor)),
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        fontFamily: "Poppins",
      ),
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AppAuth) {
            return MainScreen();
          } else if (state is AppUnAuth) {
            return Login();
          } else if (state is AppLoading) {
            return LoadingFull();
          }

          return SplashScreen();
        },
      ),
    );
  }
}
