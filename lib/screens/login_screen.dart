import 'dart:convert';

import 'package:eorganic/provider/location_provider.dart';
import 'package:eorganic/provider/user_auth_provider.dart';
import 'package:eorganic/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuthProvider>(context);
    final userLocation = Provider.of<LocationProvider>(context);

    bool _validPhoneNumber = false;
    var _numberController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: StatefulBuilder(
          builder: (context, StateSetter mystate) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible:
                              userAuth.error == "Invalid OTP" ? true : false,
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  userAuth.error.toString(),
                                  style: TextStyle(color: MyTheme.green),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ),
                        Text('Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: MyTheme.darkBluishColor,
                                fontSize: 20.0)),
                        Text('login with you phone number ',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: MyTheme.darkBluishColor,
                                fontSize: 20.0)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _numberController,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      prefixText: "+977",
                      labelText: 'mobile number',
                    ),
                    onChanged: (value) {
                      if (value.length == 10) {
                        mystate(() {
                          _validPhoneNumber = true;
                        });
                      } else {
                        _validPhoneNumber = false;
                      }
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  AbsorbPointer(
                    absorbing: _validPhoneNumber ? false : true,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.green)),
                      onPressed: () {
                        mystate(() {
                        //  userAuth.onLoading = true;
                         userAuth.screen="MapScreen";
                         userAuth.latitude=userLocation.latitude;
                         userAuth.longitude=userLocation.longitude;
                         userAuth.address=userLocation.selectedAddress.addressLine;
                         
                        });
                        String number = "+977${_numberController.text}";
                        print('button pressed');
                        // ignore: avoid_single_cascade_in_expression_statements
                        userAuth
                            .verifyPhone(
                          context: context,
                          number: number,
                            // latitude: userLocation.latitude,
                            // longitude: userLocation.longitude,
                            // address: userLocation.selectedAddress.addressLine,
                        )
                            .then((value) {
                          _numberController.clear();
                        });
                        _numberController.clear();
                      },
                      child: Text(
                        _validPhoneNumber ? 'Continue' : 'enter your number',
                        style: TextStyle(color: MyTheme.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
