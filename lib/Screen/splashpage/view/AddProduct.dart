import 'package:bookapp/Screen/splashpage/Controller/SplashController.dart';
import 'package:bookapp/utils/fireHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  SplashController splashController = Get.put(SplashController());
  TextEditingController txtbname = TextEditingController();
  TextEditingController txtbimage = TextEditingController();
  TextEditingController txtauthorname = TextEditingController();
  TextEditingController txtaboutAuthor = TextEditingController();
  TextEditingController txtaboutbook = TextEditingController();
  TextEditingController txtRating = TextEditingController();
  TextEditingController txtpyear = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade100,
          title: Text(
            "Add Book",
            style: GoogleFonts.kalam(),
          ),
        ),
        body: Form(
          key: key,
          child: Stack(
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField( validator: (value) {
                        if (value!.isEmpty) {
                          return "plese enter book name ";
                        }
                      },
                        controller: txtbname,
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
                            Icons.book_outlined,
                            color: Colors.white,
                          ),
                          hintText: "Book Name",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtbimage,   style: GoogleFonts.kalam(color: Colors.white),
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
                            Icons.image,
                            color: Colors.white,
                          ),
                          hintText: "Book Image Link",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtauthorname,   style: GoogleFonts.kalam(color: Colors.white),
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
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: "Author Name",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtaboutAuthor,   maxLines: 5,
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
                            Icons.edit,
                            color: Colors.white,
                          ),
                          hintText: "About Author",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtaboutbook,   maxLines: 5,
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
                            Icons.menu_book,
                            color: Colors.white,
                          ),
                          hintText: "About Book",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(  controller: txtRating,
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
                            Icons.star_rate,
                            color: Colors.white,
                          ),
                          hintText: "Rating",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: TextFormField(
                        controller: txtpyear,    style: GoogleFonts.kalam(color: Colors.white),
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
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          hintText: "Publishing Year",
                          hintStyle: GoogleFonts.kalam(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(fixedSize: Size(300, 50)),
                        onPressed: () {
                          FireHelper.fireHelper.getData();

                        },
                        child: Text(
                          "Finish",
                          style: GoogleFonts.kalam(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
