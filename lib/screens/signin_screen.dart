import 'package:eorganic/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          body: const SingleChildScrollView(
            child: SignInForm(),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Dont have account',
                  style: TextStyle(fontSize: 20, color: MyTheme.textColor),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, color: MyTheme.green),
                  ),
                ),
              ],
            ),
          ),
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
                color: MyTheme.textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
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
                    Icons.password_rounded,
                    color: MyTheme.green,
                  ),
                ),
                const SizedBox(height: 20.0),
                signin(),
                const SizedBox(height: 20.0),
                Text(
                  'or continue with',
                  style: TextStyle(
                      //fontWeight: FontWeight.w100,
                      fontSize: 17,
                      color: MyTheme.green),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        child: SvgPicture.asset('assets/image/facebook.svg')),
                    const SizedBox(width: 30),
                    InkWell(
                        child: SvgPicture.asset('assets/image/twitter.svg')),
                    const SizedBox(width: 30),
                    InkWell(
                        child:
                            SvgPicture.asset('assets/image/google-icon.svg')),
                  ],
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
        hintStyle: TextStyle(color: MyTheme.textColor),
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
          borderSide: const BorderSide(
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
