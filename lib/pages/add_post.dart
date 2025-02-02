import 'package:flutter/material.dart';
import 'package:insta_clone/const/colors.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("Add Post"),
        actions: [
          TextButton(
            onPressed: (){}, 
            child: Text("Post"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue
            ),
          )
        ],
      ),






      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1735627062325-c978986b1871?q=80&w=2012&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
              ),



              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: TextField(
                  decoration: InputDecoration(
                    
                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}