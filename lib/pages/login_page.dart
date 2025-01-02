import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/const/colors.dart';
import 'package:insta_clone/const/images.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/signup_page.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/responsive/mobile_layout.dart';
import 'package:insta_clone/responsive/responsive_layout_screen.dart';
import 'package:insta_clone/responsive/web_layout.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:insta_clone/widget/textfield_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  bool _isLoading = false;



  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();

  }



  void loginUser()async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text,password: _pwController.text);
    if (res == "success") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResponsiveLayoutScreen(webLayout: WebLayout(),mobileLayout: MobileLayout(),),));
    } else {
      showSnackBar(res, context);
    }

    setState(() {
      _isLoading = false;
    });
 

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
                controller: _pwController, 
                hintText: "Password", 
                isPW: true,
                textInputType: TextInputType.visiblePassword
              ),

              SizedBox(height: 24,),
              
              
              // login button
              InkWell(
                onTap: loginUser,
                child: Container(
                  child: _isLoading? Center(child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white,),) : const Text("Log in"),
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
              ),

              SizedBox(height: 12,),
              Flexible(child: Container(), flex: 2,),
              
              
              // transition to signup page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account?"),
                  TextButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                    }, 
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