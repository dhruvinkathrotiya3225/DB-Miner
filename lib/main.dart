import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes/Helpers/Db_helper.dart';
import 'package:life_quotes/screens/author_box.dart';
import 'package:life_quotes/screens/category_box.dart';
import 'package:life_quotes/screens/details_page.dart';
import 'package:life_quotes/screens/splash_screen.dart';

import 'categories_author_page.dart';
import 'modal/Global.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
      routes: {
        'splash_screen': (context) => const SplashScreen(),
        "/": (context) => HomePage(),
        "categories_author_page": (context) => CategoryOrAuthorPage(),
        "quotes_page": (context) => CategoryOrAuthorPage(),
        'details_page': (context) => DetailsPage(),
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
  @override
  int currentindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Life Qutoes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text(
                  "Life Quotes and sayings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "OoohBaby",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      CatOrAuthArgs args = CatOrAuthArgs(
                          title: "Categories", isAuthorCat: false);
                      Navigator.of(context)
                          .pushNamed('categories_author_page', arguments: args);
                    },
                    child: ListTile(
                      leading: Icon(Icons.indeterminate_check_box),
                      title: Text("BY Topic"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CatOrAuthArgs args =
                          CatOrAuthArgs(title: 'Authors', isAuthorCat: true);
                      Navigator.of(context)
                          .pushNamed('categories_author_page', arguments: args);
                    },
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("BY Author"),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Favourites"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.light_mode_sharp),
                    title: Text("Qutoe of the day"),
                  ),
                  ListTile(
                    leading: Icon(Icons.light_mode_sharp),
                    title: Text("Favourite Pictures"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: DBHelper.dbHelper
                      .fetchLatestQuotes(tableName: "latestQuotes"),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      List<QuotesDB>? data = snapshot.data?.cast<QuotesDB>();

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('details_page',
                              arguments: data[currentindex]);
                        },
                        child: CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (val, _) {
                              currentindex = val;
                            },
                            viewportFraction: 0.9,
                            autoPlayInterval: const Duration(seconds: 4),
                            autoPlay: true,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: data!
                              .map((e) => Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    // margin: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(e.image),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.6),
                                            BlendMode.hardLight),
                                      ),
                                    ),
                                    child: Text(
                                      e.quote,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.alike(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          CatOrAuthArgs args = CatOrAuthArgs(
                              title: "Categories", isAuthorCat: false);
                          Navigator.of(context).pushNamed(
                              'categories_author_page',
                              arguments: args);
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffA45584),
                          ),
                          child: Icon(Icons.grid_view),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Categories")
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Arguments args = Arguments(
                              title: "Pic", isAuthCat: false, name: 'pic');
                          Navigator.of(context)
                              .pushNamed('quotes_page', arguments: args);
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff7589C8),
                          ),
                          child: Icon(Icons.image_outlined),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Pic qutoes")
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Arguments args = Arguments(
                              title: 'Latest', isAuthCat: false, name: 'pic');

                          Navigator.of(context)
                              .pushNamed('quotes_page', arguments: args);
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffB99041),
                          ),
                          child: Icon(Icons.grid_view),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Latest")
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff6C9978),
                          ),
                          child: Icon(Icons.menu_book),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text("Articals")
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Most Popular",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Happiness',
                                isAuthCat: false,
                                name: 'happiness');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Happiness',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Love', isAuthCat: false, name: 'love');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Love',
                              context: context))),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Success',
                                isAuthCat: false,
                                name: 'success');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Success',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Wisdom',
                                isAuthCat: false,
                                name: 'wisdom');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Wisdom',
                              context: context))),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Quotes by Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      CatOrAuthArgs args = CatOrAuthArgs(
                          title: 'Categories', isAuthorCat: false);

                      Navigator.of(context)
                          .pushNamed('categories_author_page', arguments: args);
                    },
                    child: const Text(
                      "View All >",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Ambition',
                                isAuthCat: false,
                                name: 'ambition');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Ambition',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Business',
                                isAuthCat: false,
                                name: 'business');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Business',
                              context: context))),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Friendship',
                                isAuthCat: false,
                                name: 'friendship');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Friendship',
                              context: context))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Humor',
                                isAuthCat: false,
                                name: 'humor');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: category(
                              height: 100,
                              category: 'Humor',
                              context: context))),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Quotes by Author",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      CatOrAuthArgs args =
                          CatOrAuthArgs(title: 'Authors', isAuthorCat: true);
                      Navigator.of(context)
                          .pushNamed('categories_author_page', arguments: args);
                    },
                    child: const Text(
                      "View All >",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Elon Musk',
                                isAuthCat: true,
                                name: 'elon_musk');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: authorBox(
                              height: 500,
                              author: "Elon Musk",
                              color: const Color(0xffF5DBCE)))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Albert Einstein',
                                isAuthCat: true,
                                name: 'albert_einstein');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: authorBox(
                              height: 500,
                              author: "Albert Einstein",
                              color: const Color(0xffFDE490)))),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Thomas Aquinas',
                                isAuthCat: true,
                                name: 'thomas_aquinas');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: authorBox(
                              height: 500,
                              author: "Thomas\nAquinas",
                              color: const Color(0xffB8D7E9)))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            Arguments args = Arguments(
                                title: 'Marianne Williamson',
                                isAuthCat: true,
                                name: 'marianne_williamson');
                            Navigator.of(context)
                                .pushNamed('quotes_page', arguments: args);
                          },
                          child: authorBox(
                              height: 500,
                              author: "Marianne Williamson",
                              color: const Color(0xffF6CDDF)))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CatOrAuthArgs {
  final String title;
  final bool isAuthorCat;

  CatOrAuthArgs({
    required this.title,
    required this.isAuthorCat,
  });
}

class Arguments {
  final String title;
  final String name;
  final bool isAuthCat;

  Arguments({required this.title, required this.isAuthCat, required this.name});
}

// https://type.fit/api/quotes
