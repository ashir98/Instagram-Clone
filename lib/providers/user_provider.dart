import 'package:flutter/material.dart';
import 'package:insta_clone/model/user_model.dart';
import 'package:insta_clone/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier{

  AuthMethods _authMethods = AuthMethods();

  UserModel? _user;

  UserModel get getUser => _user!;

  Future<void> refreshUser()async{
    UserModel userModel = await _authMethods.getUserDetail();
    _user = userModel;
    notifyListeners();
  }  

}