import 'package:eorganic/provider/user_auth_provider.dart';
import 'package:eorganic/routes/my_routes.dart';
import 'package:eorganic/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthenticationService>(context);
    final userAuth = Provider.of<UserAuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("this is home"),
            TextButton(
              onPressed: () {
                userAuth.error = "";
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacementNamed(
                      context, MyRoutes.onboardingScreenRoute);
                });
              },
              child: const Text('signout'),
            ),
            TextButton(
              onPressed: () {
               Navigator.pushNamed(context, MyRoutes.onboardingScreenRoute);
              },
              child: const Text('on board'),
            )
          ],
        ),
      ),
    );
  }
}
