import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final String bio;
  final String imgUrl;
  final List<String> followers;
  final List<String> following;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    required this.imgUrl,
    required this.followers,
    required this.following,
  });

  // Factory method to create a UserModel from Firestore document
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      bio: data['bio'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
      followers: List<String>.from(data['followers'] ?? []),
      following: List<String>.from(data['following'] ?? []),
    );
  }

  // Method to convert a UserModel to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'bio': bio,
      'imgUrl': imgUrl,
      'followers': followers,
      'following': following,
    };
  }




  // static UserModel fromSnap(DocumentSnapshot snap){
  //   var snapshot = snap.data() as Map<String,dynamic>;
  //   return UserModel(


  //   );

  // }
}
