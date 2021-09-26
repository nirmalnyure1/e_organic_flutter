import 'package:eorganic/main.dart';
import 'package:eorganic/models/user_model.dart';
import 'package:eorganic/screens/home_screen.dart';
import 'package:eorganic/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInChecker extends StatelessWidget {
  const SignInChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticationService = Provider.of<AuthenticationService>(context);
    return StreamBuilder(
      stream: authenticationService.user,
      builder: (_, AsyncSnapshot<UserModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserModel? user = snapshot.data;

          return user == null ? SplashScreen() : HomeScreen();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
    //stream:authenticationService.user.first
  }
}
