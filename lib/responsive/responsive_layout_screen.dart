import 'package:flutter/material.dart';
import 'package:insta_clone/const/dimensions.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  Widget webLayout, mobileLayout;
  ResponsiveLayoutScreen({super.key, required this.webLayout, required this.mobileLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webLayout;
        }
        else return mobileLayout;
      },
    );
  }
}