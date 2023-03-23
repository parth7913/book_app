import 'package:bookapp/Screen/splashpage/view/holdScreen.dart';
import 'package:bookapp/Screen/splashpage/view/signupScreen.dart';
import 'package:bookapp/Screen/splashpage/view/signInScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => HoldScreen(),
        'signin': (p0) => SignInScreen(),
        // 'home': (p0) => SplashScreen(),
        'signup': (p0) => SignUpScreen(),
      },
    ),
  );
}
