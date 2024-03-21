import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  late final String uid;
  DatabaseService({required this.uid});

  //reference for the collections]
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
  FirebaseFirestore.instance.collection("groups");

  //updating user data
Future updateUserData(String fullName, String email) async{
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
}

}