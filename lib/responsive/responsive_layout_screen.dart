import 'package:flutter/material.dart';
import 'package:insta_clone/const/dimensions.dart';
import 'package:insta_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ResponsiveLayoutScreen extends StatefulWidget {
  final Widget webLayout, mobileLayout;
  ResponsiveLayoutScreen({super.key, required this.webLayout, required this.mobileLayout});

  @override
  State<ResponsiveLayoutScreen> createState() => _ResponsiveLayoutScreenState();
}

class _ResponsiveLayoutScreenState extends State<ResponsiveLayoutScreen> {
  
  @override
  void initState() {
    super.initState();
    getUserData();
  }


  getUserData()async{
    UserProvider _userProvider = Provider.of<UserProvider>(context,listen: false);
    await _userProvider.refreshUser();
  }
  
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webLayout;
        }
        else return widget.mobileLayout;
      },
    );
  }
}