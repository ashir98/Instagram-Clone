import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/const/colors.dart';
import 'package:insta_clone/const/images.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:insta_clone/widget/textfield_input.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;



  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();
  }



  void selectImage()async{

    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }



  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _pwController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      
    }


    
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




              Stack(
                children: [
                  _image != null
                  ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                                    
                  : CircleAvatar(
                    radius: 64,
                    backgroundColor: blueColor,   
                  ),

                  Positioned(
                    bottom: -5,
                    left: 90,
                    child: IconButton(
                      onPressed: (){
                        selectImage();
                      },
                      icon: Icon(Icons.add_a_photo),
                    )
                  )
                ],
              ),






              SizedBox(height: 24,),
              
              
              // textfield for name
              TextFieldInput(
                controller: _usernameController, 
                hintText: "Username", 
                textInputType: TextInputType.text
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


              // textfield for name
              TextFieldInput(
                controller: _bioController, 
                hintText: "Bio", 
                textInputType: TextInputType.text
              ),


              SizedBox(height: 24,),
              
              
              // SignUp button
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading? Center(child: CircularProgressIndicator(strokeWidth: 3,color: Colors.white,),) : const Text("Sign uo"),
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
                  Text("Already have an account?"),
                  TextButton(
                    onPressed:(){}, 
                    child: Text("Sign in")
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