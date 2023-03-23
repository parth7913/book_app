import 'dart:async';

import 'package:bookapp/Screen/splashpage/Controller/SplashController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HoldScreen extends StatefulWidget {
  const HoldScreen({Key? key}) : super(key: key);

  @override
  State<HoldScreen> createState() => _HoldScreenState();
}

class _HoldScreenState extends State<HoldScreen> {
  SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    splashController.HoldScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 230,
                width: 230,
                child: Lottie.asset("assets/lottie/booklottie.json"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Make Your BooK !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.satisfy(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
