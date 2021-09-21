import 'package:eorganic/routes/my_routes.dart';
import 'package:eorganic/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: const SingleChildScrollView(
              child: SignInForm(),
            ),
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
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.signupScreenRoute);
                  },
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

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool? checkboxvalue = false;
  final formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      print('validate');
    } else {
      print('invalidate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Form(
      key: formKey,
      autovalidate: true,
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
                    //  err: 'email can not be empity',
                    icon: Icon(
                      Icons.account_box_rounded,
                      color: MyTheme.green,
                    )),
                const SizedBox(height: 20.0),
                textformField(
                  hint: 'enter your passwor',
                  lable: 'password',
                  // err: 'pssword cannot be empty',
                  icon: Icon(
                    Icons.password_rounded,
                    color: MyTheme.green,
                  ),
                ),
                const SizedBox(height: 20.0),

                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      value: checkboxvalue,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxvalue = value;
                        });
                      },
                    ),
                    Text(
                      'rememver me',
                      style: TextStyle(color: MyTheme.textColor),
                    ),
                    const SizedBox(width: 120.0),
                    Text(
                      'forget password?',
                      style: TextStyle(color: MyTheme.green),
                    )
                  ],
                ),
                signin(),
                const SizedBox(height: 20.0),
                Text(
                  'or continue with',
                  style: TextStyle(
                      //fontWeight: FontWeight.w100,
                      fontSize: 17,
                      color: MyTheme.textColor),
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
                ),
                // const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  TextFormField textformField({
    String? lable,
    String? hint,
    Icon? icon,
    bool obsecureText = true,
    //String err = 'error',
  }) {
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
      validator: obsecureText ? passwrodValidator() : emailValidator(),
    );
  }

  Container signin() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: 400,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        onPressed: () {
          validate();
        },
        child: const Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  MultiValidator emailValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'required'),
      EmailValidator(errorText: 'not valid'),
    ]);
  }

  MultiValidator passwrodValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'required'),
      MinLengthValidator(6, errorText: 'pssword should be greater then 6'),
      MaxLengthValidator(15, errorText: "password should be less then 15"),
      // PasswordCredential(data_OR_form)
    ]);
  }
}
