import 'package:eorganic/provider/user_auth_provider.dart';
import 'package:eorganic/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SetLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserAuthProvider>(context);
    bool validPhoneNumber = false;
    var _numberController = TextEditingController();
    void logIn(context) {
      showModalBottomSheet(
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, StateSetter mystate) {
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              validPhoneNumber = true;
                            });
                          } else {
                            validPhoneNumber = false;
                          }
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      AbsorbPointer(
                        absorbing: validPhoneNumber ? false : true,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(MyTheme.green)),
                          onPressed: () {
                            String number = "+977${_numberController.text}";
                            print('button pressed');
                            auth.verifyPhone(context, number);
                          },
                          child: Text(
                            validPhoneNumber ? 'Continue' : 'enter your number',
                            style: TextStyle(color: MyTheme.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          context: context);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'SET YOUR LOCATION',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: MyTheme.green,
                      fontSize: 40.0),
                ),
              ),
              Text(
                "s",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: MyTheme.darkBluishColor,
                    fontSize: 15.0),
              ),
              Expanded(
                flex: 3,
                child: SvgPicture.asset(
                  'assets/image/location.svg',
                  height: MediaQuery.of(context).size.width / 2,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Expanded(flex: 1, child: SizedBox(height: 150)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: continueButton(),
                    ),
                    TextButton(
                      onPressed: () {
                        logIn(context);
                      },
                      child: RichText(
                          text: TextSpan(
                              text: 'Already have a account?  ',
                              style: TextStyle(color: MyTheme.textColor),
                              children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(color: MyTheme.green),
                            )
                          ])),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container continueButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Set Location',
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
