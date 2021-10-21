// ignore_for_file: avoid_print, prefer_function_declarations_over_variables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eorganic/routes/my_routes.dart';
import 'package:eorganic/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? otp;
  String? verificationId;
  String? error;
  bool onLoading = false;
  // var token;
  UserService userService = UserService();
  //var _otpcontroller = TextEditingController();

  Future<void> verifyPhone({
    BuildContext? context,
    number,
    double? latitude,
    double? longitude,
    String? address,
  }) async {
    notifyListeners();
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      // await _auth.signInWithCredential(credential);
      // showSnakBar(context, 'verification com');
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) async {
      print(e);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? resendToken]) async {
      this.verificationId = verificationId;

      otpDialogBox(context!, number);
      this.onLoading = false;
      notifyListeners();
    };

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (String verificationId) async {
          this.verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> otpDialogBox(BuildContext context, String number) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('verification code'),
                const Text('enter 6 digit OTP recired in you messsage'),
              ],
            ),
            content: Container(
              height: 80,
              child: TextField(
                // controller: _otpcontroller,
                onChanged: (value) {
                  this.otp = value;
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential phoneAuthCredential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId!, smsCode: otp!);
                      UserCredential userCredential =
                          await _auth.signInWithCredential(phoneAuthCredential);
                      _createUser(
                        number: userCredential.user!.phoneNumber,
                        id: userCredential.user!.uid,
                      );
                      if (userCredential != null) {
                        Navigator.pushNamed(context, MyRoutes.homeScreenRoute);
                      }
                    } catch (error) {
                      this.error = "Invalid OTP";
                      notifyListeners();

                      Navigator.of(context).pop();
                      print(error.toString() + " error here");
                    }
                  },
                  child: const Text('done'))
            ],
          );
        });
  }

  void _createUser(
      {String? id,
      String? number,
      double? latitude,
      double? longitude,
      String? address}) {
    userService.createUser({
      "id": id,
      "number": number,
      // "location":GeoPoint(latitude!,longitude!),
      'address': address,
    });
  }

  void updateUser(
      {String? id,
      String? number,
      double? latitude,
      double? longitude,
      String? address}) {
    userService.updateUser({
      "id": id,
      "number": number,
      "location": GeoPoint(latitude!, longitude!),
      'address': address,
    });
  }
}
