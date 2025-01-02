import 'package:flutter/material.dart';
import 'package:insta_clone/model/user_model.dart';
import 'package:insta_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(
        child: Text(userModel.username),
      ),
    );
  }
}