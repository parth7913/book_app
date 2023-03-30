import 'package:bookapp/utils/fireHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Create Your Book",
              style: GoogleFonts.kalam(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  FireHelper.fireHelper.signOut();
                  Get.offNamed("signin");
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              ),
            ]),
        body: Stack(
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
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.black,
          icon: Icon(Icons.add,color: Colors.white,),
          onPressed: () {
            Get.toNamed('addPage');
          },
          label: Text(
            "ADD BOOK",
            style: GoogleFonts.kalam(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
