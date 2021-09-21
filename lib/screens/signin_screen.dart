import 'package:eorganic/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sign In'),
          ),
          body: const SingleChildScrollView(child: SignInForm()),
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Center(
            child: Text(
              'Welcome to SignIn Page ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: MyTheme.green),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Sign in with your valid  email and password',
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 17,
                color: MyTheme.darkBluishColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                textformField(
                    hint: 'enter you email',
                    lable: 'email',
                    obsecureText: false,
                    icon: Icon(
                      Icons.account_box_rounded,
                      color: MyTheme.green,
                    )),
                const SizedBox(height: 20.0),
                textformField(
                  hint: 'enter your passwor',
                  lable: 'password',
                  icon: Icon(
                    Icons.account_box_rounded,
                    color: MyTheme.green,
                  ),
                ),
                const SizedBox(height: 20.0),
                signin(),
                const SizedBox(height: 20.0),
                Row(
                    // children: [SvgPicture.asset('assets/image/facebook.svg')],
                    )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  TextFormField textformField(
      {String? lable, String? hint, Icon? icon, bool obsecureText = true}) {
    return TextFormField(
      maxLines: 1,
      maxLength: 40,
      obscureText: obsecureText ? true : false,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: TextStyle(color: MyTheme.green),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint,
        fillColor: Colors.red,
        focusColor: Colors.green,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: MyTheme.darkBluishColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: MyTheme.darkBluishColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        prefixIcon: icon,
      ),
    );
  }

  Container signin() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: 200,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
