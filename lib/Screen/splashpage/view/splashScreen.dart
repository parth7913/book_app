import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Column(
          children: [
            TextField(
              controller: txtemail,
            ),
            TextField(
              controller: txtpassword,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
