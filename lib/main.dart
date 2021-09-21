// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:eorganic/routes/my_routes.dart';
import 'package:eorganic/screens/onboard_screen.dart';
import 'package:eorganic/screens/sign_up_screen.dart';
import 'package:eorganic/screens/signin_screen.dart';
import 'package:eorganic/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: SplashScreen(),
      theme: MyTheme.lightTheme(context),

      debugShowCheckedModeBanner: false,
      // initialRoute: '/splash',
      routes: {
        "/": (context) => SignInScreen(),
        MyRoutes.splashScreenRoute: (context) => SplashScreen(),
        MyRoutes.onboardingScreenRoute: (context) => OnBoardScreen(),
        MyRoutes.signinScreenRoute: (context) => SignInScreen(),
        MyRoutes.signupScreenRoute: (context) => SignUpScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return OnBoardScreen();
        }),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.green,
      body: Center(
        child: SvgPicture.asset(
          'assets/image/welcome.svg',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
