import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart' as model;
class AuthController extends GetxController
{
  static AuthController instance=Get.find();
  late Rx<File?> _pickedimage;
  File? get profilephoto => _pickedimage.value;

  void pickimage() async
  {
    final pickedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedimage!=null)
      {
        Get.snackbar("profile picture", "Sucessfully added profile picture");
      }
    _pickedimage=Rx<File?>(File(pickedimage!.path));
  }
  Future<String>_uploadToStorage(File image) async
  {
   Reference ref= firebaseStorage.ref().child("profilepics").child(firebaseAuth.currentUser!.uid);
   UploadTask uploadtask =  ref.putFile(image);
   TaskSnapshot snap= await uploadtask;
   String downloadUrl = await snap.ref.getDownloadURL();
   return downloadUrl;
  }
     void registerUser(String username,String email,String password,File? image) async
     {
       try{
         if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image!=null)
           {
            UserCredential cred= await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

        String downloadUrl = await _uploadToStorage(image);
         model.User user= model.User(name: username,email:email,uid: cred.user!.uid,profilephoto: downloadUrl);
         await firestore.collection("userslogindata").doc(cred.user!.uid).set(user.toJson());
         }
         else{
           Get.snackbar("Error in Creating an Account", "please Enter all the Feilds");
         }
       }
       catch(e)
       {
            Get.snackbar("Error in Creating an Account", e.toString());
       }
     }
     void Loginuser(String email,String password) async
     {
       try
       {
         if(email.isNotEmpty && password.isNotEmpty)
           {
                 await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                 Get.snackbar("Notification", "Login Success");
           }
         else{
           Get.snackbar("Error in logining an Account", "please Enter all the Feilds");
         }
       }
       catch(e)
       {
         Get.snackbar("Error in Login Account", e.toString());
       }
     }
}