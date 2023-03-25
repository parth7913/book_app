import 'package:bookapp/Screen/splashpage/Controller/SplashController.dart';
import 'package:bookapp/utils/fireHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  SplashController splashController = Get.put(SplashController());
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: key,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/background1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black26,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome !",
                        style: GoogleFonts.kalam(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtemail,
                        style: GoogleFonts.kalam(color: Colors.white),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: "Email Address",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter your email";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtpassword,
                        style: GoogleFonts.kalam(color: Colors.white),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter your password";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(fixedSize: Size(350, 50)),
                        onPressed: () {
                          if(key.currentState!.validate()){
                            FireHelper.fireHelper.signInUser(txtemail.text, txtpassword.text);
                            Get.offNamed("home");
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.kalam(
                              fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        FireHelper.fireHelper.checkUser();
                        Get.toNamed("signup");
                      },
                      child: Text(
                        "Don't Have Account ?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kalam(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 100,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "or",
                            style: GoogleFonts.kalam(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 2,
                            width: 100,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              size: 50,
                              color: Colors.blue,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                             bool Login = await FireHelper.fireHelper.signInWithGoogle();
                             if(Login){
                               Get.offNamed('home');
                             }
                             else{
                               Get.snackbar("please check your emailId", "error");
                             }
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset("assets/images/Googlu.png")),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
