import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // static const ID = 'id';
  // static const EMAIL = "email";

  String? _id;
  String? _email;

  //getter method 
  String? get email => _email;
  String? get id => _id;

  // String? id;
  // String? email;
  // String? password;
//  UserModel({this.id, this.email, this.password});

  UserModel.fromsnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data() as String?;

    _email = snapshot.data() as String?;
  }
}
