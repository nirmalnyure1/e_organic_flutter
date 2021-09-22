import 'package:eorganic/routes/my_routes.dart';
import 'package:eorganic/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("this is home"),
            TextButton(
                onPressed: () {
                  authService.signOut();
                  Navigator.pushReplacementNamed(
                      context, MyRoutes.signinScreenRoute);
                },
                child: const Text('signout'))
          ],
        ),
      ),
    );
  }
}
