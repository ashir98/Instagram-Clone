import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/resources/storage_methods.dart';

import '../model/user_model.dart';

class AuthMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;


  // signup method
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  })async{
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file != null ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);


        String imgUrl = await StorageMethods().uploadImage('profile_pictures', file, false);

        UserModel user = UserModel(
          uid: _auth.currentUser!.uid,
          username: username,
          email: email,
          bio: bio,
          imgUrl: imgUrl,
          followers: [],
          following: []
        );


        // add user to the database
        await _db.collection('users').doc(_auth.currentUser!.uid).set(
          user.toMap()
        );
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;

  }




  // logging in user
  Future<String> loginUser({
    required String email, 
    required String password
  })async{
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }
      else{
        res = "please enter all the fields";
      }
    } catch (e) {
      res = e.toString();
    } 
    return res;
  }
}