

// import 'package:eorganic/models/user_model.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;

// class AuthenticationService {
//   final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

//   UserModel? _userFromFirebase(auth.User? user) {
//     if (user == null) {
//       return null;
//     }
//     // return UserModel(
//     //   id: user.uid,
//     //   email: user.email,
//     // );
//   }

//   Stream<UserModel?>? get user =>
//       _firebaseAuth.authStateChanges().map((_userFromFirebase));

//   Future<UserModel?> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       final credential = await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       assert(credential.user != null);
//       // ignore: unnecessary_null_comparison
//       assert(await credential.user!.getIdToken() != null);
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<UserModel?> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       final credential = await _firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       return _userFromFirebase(credential.user);
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> signOut() async {
//     return await _firebaseAuth.signOut();
//   }
// }
