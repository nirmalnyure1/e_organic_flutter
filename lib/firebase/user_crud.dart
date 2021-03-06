import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eorganic/models/user_model.dart';

class UserService {
  String collection = 'user';
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //create new user
  Future<void> createUser(Map<String, dynamic> values) async {
    String id = values['id'];
    await firebaseFirestore.collection(collection).doc(id).set(values);
  }

  Future<void> updateUser(Map<String, dynamic> values) async {
    String id = values['id'];

    await firebaseFirestore.collection(collection).doc(id).update(values);
  }

  Future<DocumentSnapshot> getUserById(String id) async {
    DocumentSnapshot result =
        await firebaseFirestore.collection(collection).doc(id).get();
    return result;
  }
}
