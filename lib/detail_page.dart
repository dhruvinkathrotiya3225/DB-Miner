import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({Key? key}) : super(key: key);

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Container(
          //   height: height,
          //   width: width,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       opacity: 0.5,
          //       image: NetworkImage(
          //           "https://media.istockphoto.com/id/1347249084/photo/relaxing-canadian-timberwolves.jpg?b=1&s=170667a&w=0&k=20&c=q7tjAi7XliVoy9bNO6h99c6w-7yXDHx5LYujUVXavQA="),
          //     ),
          //   ),
          // ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 280),
            height: 520,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.4,
                image: NetworkImage(
                    "https://media.istockphoto.com/id/1386110896/photo/jasper-national-park-in-alberta-canada.jpg?b=1&s=170667a&w=0&k=20&c=RyY7R-ZSu-eCf5JFu5bxgfyGde9uKXN9Grio_xexvdo="),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "${res["des"]}",
                  style: GoogleFonts.abhayaLibre(
                      color: Colors.white, fontSize: 23),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${res["image"]}"),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
