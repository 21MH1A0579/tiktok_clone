import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilephoto;
  String email;
  String uid;
  User
      (
          {
            required this.name,
            required this.profilephoto,
            required this.email,
            required this.uid,
          }
      );
  Map<String,dynamic> toJson() =>{
    "name":name,
    "profilephoto":profilephoto,
    "email":email,
    "uid":uid
  };
  static User fromSnap(DocumentSnapshot snap)
  {
    var snapshot=snap.data() as Map<String,dynamic>;
    return User(name: snapshot["name"], profilephoto: snapshot["profilephoto"], email: snapshot["email"], uid: snapshot["uid"]);
  }
}