import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/firebase_options.dart';
import 'package:insta_clone/pages/login_page.dart';
import 'package:insta_clone/pages/signup_page.dart';
import 'package:insta_clone/responsive/mobile_layout.dart';
import 'package:insta_clone/responsive/responsive_layout_screen.dart';
import 'package:insta_clone/responsive/web_layout.dart';
import 'package:insta_clone/themes/dark_theme.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      },
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: darkTheme,
      // home: ResponsiveLayoutScreen(webLayout: WebLayout(), mobileLayout: MobileLayout()),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ResponsiveLayoutScreen(
                webLayout: WebLayout(), 
                mobileLayout: MobileLayout()
              );
            }


            else if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          return LoginPage();
        },
      ),
    );
  }
}
