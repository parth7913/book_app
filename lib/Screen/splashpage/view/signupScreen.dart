import 'package:bookapp/utils/fireHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  TextEditingController txtcpass = TextEditingController();

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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/background1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.kalam(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtusername,
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
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: "Username",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "pls enter your email";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtpass,
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
                            return "pls enter your password";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtcpass,
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
                          hintText: "Confirm Password",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "pls enter your confirm password";
                          } else if (value != txtpass.text) {
                            return "pls check your confirm password";
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
                          if (key.currentState!.validate()) {
                            FireHelper.fireHelper
                                .signUpUser(txtusername.text, txtpass.text);
                            Get.back();
                            Get.snackbar("${txtusername.text}", "Login Successful");
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.kalam(
                              fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Have An Account ?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kalam(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed("signin");
                          },
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.kalam(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
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
