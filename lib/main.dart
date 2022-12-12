import 'dart:typed_data';

import 'package:animal_biography/detail_page.dart';
import 'package:animal_biography/modal/Global.dart';
import 'package:animal_biography/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Helpers/image_api_helper.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
      routes: {
        "/": (context) => HomePage(),
        "splash_screen": (context) => IntroScreen(),
        "detail_page": (context) => Details_Page(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle textStyle = GoogleFonts.ubuntu(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 1,
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: ImageAPIHelper.imageAPIHelper
                .getImage(name: 'background,wild animal'),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error:${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                Uint8List data = snapshot.data as Uint8List;
                return Container(
                  height: height * 0.38,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        const Color(0xffC19E82).withOpacity(0.6),
                        BlendMode.darken,
                      ),
                      image: MemoryImage(data),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 38),
                      const Spacer(),
                      Text(
                        "Welcome to\nAnimal biography ",
                        style: GoogleFonts.ubuntu(
                          fontSize: 48,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 280),
                width: width,
                height: height * 0.65,
                padding: const EdgeInsets.only(left: 26, right: 26),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.7,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1670100053465-aacb32bf96ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8NzcwMzc3fHxlbnwwfHx8fA%3D%3D&dpr=2&auto=format&fit=crop&w=294&q=60"),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, -0.2),
                        spreadRadius: 2,
                        blurRadius: 16,
                      ),
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("detail_page",
                              arguments: Globle.Animals[0]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1546182990-dffeafbe841d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 3)),
                          child: Text(
                            "Lion",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("detail_page",
                              arguments: Globle.Animals[1]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1505148230895-d9a785a555fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZWxlcGhhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60"),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 3)),
                          child: Text(
                            "Elephant",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("detail_page",
                              arguments: Globle.Animals[2]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFiYml0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 3)),
                          child: Text(
                            "Rabbits",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("detail_page",
                              arguments: Globle.Animals[3]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1594069033313-8920df9150b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG91cnNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 3)),
                          child: Text(
                            "Horse",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("detail_page",
                              arguments: Globle.Animals[4]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                  "https://plus.unsplash.com/premium_photo-1664302930577-bfa333b6ae86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 3)),
                          child: Text(
                            "Bear",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("detail_page",
                              arguments: Globle.Animals[5]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.5,
                                image: NetworkImage(
                                  "https://plus.unsplash.com/premium_photo-1661897154120-5b27cd6a0bd5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c25ha2V8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 3)),
                          child: Text(
                            "Snake",
                            style: GoogleFonts.ubuntu(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
