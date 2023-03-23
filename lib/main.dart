import 'package:bookapp/Screen/splashpage/view/signupScreen.dart';
import 'package:bookapp/Screen/splashpage/view/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (p0) => SplashScreen(),
        '/': (p0) => SignUpScreen(),
      },
    ),
  );
}
