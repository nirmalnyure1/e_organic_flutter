import 'package:eorganic/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sign Up'),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sigin up with you detail ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: MyTheme.textColor,
                  ),
                ),
              ],
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: const SingleChildScrollView(
              child: SignUpForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  validate() {
    if (formKey.currentState!.validate()) {
      // ignore: avoid_print
      print('validate');
    } else {
      // ignore: avoid_print
      print('invalidate');
    }
    if (_pass.text != _confirmPass.text) {
      return 'password not match';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidate: true,
      child: Column(
        children: [
          Center(
            child: Text(
              'Register your Account',
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
            'Register your account with valid information',
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 17,
                color: MyTheme.textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                textformField(
                  hint: 'enter your email',
                  lable: 'email',
                  obsecureText: false,
                  // err: 'pssword cannot be empty',
                  icon: Icon(
                    Icons.account_box_rounded,
                    color: MyTheme.green,
                  ),
                ),
                const SizedBox(height: 20.0),
                textformField(
                  controller: _pass,
                  hint: 'enter your password',
                  lable: 'password',
                  // err: 'pssword cannot be empty',
                  icon: Icon(
                    Icons.password_rounded,
                    color: MyTheme.green,
                  ),
                ),
                const SizedBox(height: 80.0),
               
                Container(
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
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextFormField textformField({
    String? lable,
    String? hint,
    Icon? icon,
    bool obsecureText = true,
    TextEditingController? controller,
    //String err = 'error',
  }) {
    return TextFormField(
      controller: controller,
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
