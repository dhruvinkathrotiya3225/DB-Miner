import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/image_api_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () =>
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
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
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    const Color(0xffC19E82).withOpacity(0.6),
                    BlendMode.darken,
                  ),
                  image: MemoryImage(data),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 100),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 26),
                    Text(
                      "Please wait\n App Take some time to Start",
                      style: GoogleFonts.alef(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
