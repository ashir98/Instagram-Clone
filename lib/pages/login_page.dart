import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/const/colors.dart';
import 'package:insta_clone/const/images.dart';
import 'package:insta_clone/widget/textfield_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();



  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 1,),
              // svg image
              SvgPicture.asset(
                AppImages.instaLogoSvg, 
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                height: 64,
              ),


              SizedBox(height: 24,),
              
              
              // textfield for email
              TextFieldInput(
                controller: _emailController, 
                hintText: "Email", 
                textInputType: TextInputType.emailAddress
              ),


              SizedBox(height: 24,),
              
              // textfield for name
              TextFieldInput(
                controller: _emailController, 
                hintText: "Password", 
                isPW: true,
                textInputType: TextInputType.visiblePassword
              ),

              SizedBox(height: 24,),
              
              
              // login button
              Container(
                child: const Text("Log in"),
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5)
                    ), 
                  ),
                  color: blueColor
                ),
              ),

              SizedBox(height: 12,),
              Flexible(child: Container(), flex: 2,),
              
              
              // transition to signup page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account?"),
                  TextButton(
                    onPressed:(){}, 
                    child: Text("Sign up")
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}