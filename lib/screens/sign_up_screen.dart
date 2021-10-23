// import 'package:eorganic/routes/my_routes.dart';
// import 'package:eorganic/services/auth_service.dart';
// import 'package:eorganic/widgets/my_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:provider/provider.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Sign Up'),
//           ),
//           bottomSheet: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Already have a account ?',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: MyTheme.textColor,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10.0,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushReplacementNamed(
//                             context, MyRoutes.signinScreenRoute);
//                       },
//                       child: Text(
//                         'SignIn',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: MyTheme.green,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           body: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).requestFocus(FocusNode());
//             },
//             child: const SingleChildScrollView(
//               child: SignUpForm(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignUpForm extends StatefulWidget {
//   const SignUpForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController _pass = TextEditingController();
//   final TextEditingController _email = TextEditingController();

//   bool? validate() {
//     if (formKey.currentState!.validate()) {
//       // ignore: avoid_print
//       return true;
//       print('validate');
//     } else {
//       return false;
//       // ignore: avoid_print
//       print('invalidate');
//     }
//     // if (_pass.text != _confirmPass.text) {
//     //   return 'password not match';
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthenticationService>(context);
//     return Form(
//       key: formKey,
//       autovalidateMode: AutovalidateMode.always,
//       child: Column(
//         children: [
//           Center(
//             child: Text(
//               'Register your Account',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                   color: MyTheme.green),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             'Register your account with valid information',
//             style: TextStyle(
//                 fontWeight: FontWeight.w100,
//                 fontSize: 17,
//                 color: MyTheme.textColor),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const SizedBox(height: 150.0),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 textformField(
//                   hint: 'enter your email',
//                   lable: 'email',
//                   obsecureText: false,
//                   controller: _email,
//                   // err: 'pssword cannot be empty',
//                   icon: Icon(
//                     Icons.account_box_rounded,
//                     color: MyTheme.green,
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 textformField(
//                   controller: _pass,
//                   hint: 'enter your password',
//                   lable: 'password',
//                   // err: 'pssword cannot be empty',
//                   icon: Icon(
//                     Icons.password_rounded,
//                     color: MyTheme.green,
//                   ),
//                 ),
//                 const SizedBox(height: 80.0),
//                 Container(
//                   //padding: EdgeInsets.symmetric(horizontal: 10.0),
//                   width: 400,
//                   height: 60.0,
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: TextButton(
//                     onPressed: () async {
//                       if (validate()!) {
//                         await authService.createUserWithEmailAndPassword(
//                             _email.text, _pass.text);
//                         Navigator.pushReplacementNamed(
//                             context, MyRoutes.signinScreenRoute);
//                       }
//                     },
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.w300),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   TextFormField textformField({
//     String? lable,
//     String? hint,
//     Icon? icon,
//     bool obsecureText = true,
//     TextEditingController? controller,
//     //String err = 'error',
//   }) {
//     return TextFormField(
//       controller: controller,
//       maxLines: 1,
//       maxLength: 40,
//       obscureText: obsecureText ? true : false,
//       decoration: InputDecoration(
//         labelText: lable,
//         labelStyle: TextStyle(color: MyTheme.green),
//         hintStyle: TextStyle(color: MyTheme.textColor),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         hintText: hint,
//         fillColor: Colors.red,
//         focusColor: Colors.green,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(color: MyTheme.darkBluishColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(color: MyTheme.darkBluishColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20.0),
//           borderSide: const BorderSide(
//             color: Colors.green,
//           ),
//         ),
//         prefixIcon: icon,
//       ),
//       validator: obsecureText ? passwrodValidator() : emailValidator(),
//     );
//   }

//   MultiValidator emailValidator() {
//     return MultiValidator([
//       RequiredValidator(errorText: 'required'),
//       EmailValidator(errorText: 'not valid'),
//     ]);
//   }

//   MultiValidator passwrodValidator() {
//     return MultiValidator([
//       RequiredValidator(errorText: 'required'),
//       MinLengthValidator(6, errorText: 'pssword should be greater then 6'),
//       MaxLengthValidator(15, errorText: "password should be less then 15"),
//       // PasswordCredential(data_OR_form)
//     ]);
//   }
// }
