// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:eorganic/provider/location_provider.dart';
import 'package:eorganic/provider/user_auth_provider.dart';
import 'package:eorganic/routes/my_routes.dart';
import 'package:eorganic/screens/home_screen.dart';
import 'package:eorganic/screens/login_screen.dart';
import 'package:eorganic/screens/login_with_phonenumber.dart';
import 'package:eorganic/screens/map.dart';
import 'package:eorganic/screens/onboard_screen.dart';
import 'package:eorganic/widgets/my_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserAuthProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: MaterialApp(
        //home: SplashScreen(),
        theme: MyTheme.lightTheme(context),

        debugShowCheckedModeBanner: false,
        initialRoute: '/splashscreen',
        routes: {
          "/": (context) => LoginWithPhoneNumber(),
          MyRoutes.splashScreenRoute: (context) => SplashScreen(),
          MyRoutes.onboardingScreenRoute: (context) => OnBoardScreen(),
          // MyRoutes.signinScreenRoute: (context) => SignInScreen(),
          // MyRoutes.signupScreenRoute: (context) => SignUpScreen(),
          MyRoutes.homeScreenRoute: (context) => HomeScreen(),
          MyRoutes.mapRoute: (context) => MapScreen(),
          MyRoutes.loginScreenRoute: (context) => LoginScreen(),
        },
      ),
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
    Timer(Duration(seconds: 5), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushNamed(context, MyRoutes.onboardingScreenRoute);
        } else {
          Navigator.pushNamed(context, MyRoutes.homeScreenRoute);
        }
      });
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) {
      //     return OnBoardScreen();
      //   }),
      // );
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
