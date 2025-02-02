
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/const/colors.dart';
import 'package:insta_clone/const/global_variables.dart';
import 'package:insta_clone/model/user_model.dart';
import 'package:insta_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MobileLayout extends StatefulWidget {
  MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }


  navigationTapped(int page){
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }





  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: homeScreenitems,
        controller: pageController,
        onPageChanged: navigationTapped,
      ),


      bottomNavigationBar: CupertinoTabBar(
        onTap: navigationTapped,
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0? primaryColor : secondaryColor,
            )
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1? primaryColor : secondaryColor,
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_rounded,
              color: _page == 2? primaryColor : secondaryColor,
            )
          ),


          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
              color: _page == 3? primaryColor : secondaryColor,
            )
          ),


          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 4? primaryColor : secondaryColor,
            )
          ),


          





        ],
      ),
    );
  }
}