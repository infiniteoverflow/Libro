import 'package:flutter/material.dart';
import 'package:book_donation/Services/google_sign_in.dart';
import 'intro_screen.dart';
import 'package:book_donation/Services/facebook_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final bool isFacebookSignIn;

  const HomeScreen({this.isFacebookSignIn});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 28,
              ),
              suffixIcon: Icon(
                Icons.public,
                color: Colors.grey,
                size: 28,
              ),
              hintText: "Search by name, author, bookworm...",
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/books-bg.jpg',
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.lime[20]),
                  ),
                )
              ],
            ),
            /*Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),*/
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    // first block
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            spreadRadius: 0.5,
                            offset: Offset(
                              -1.0,
                              8.0,
                            ), // shadow direction: bottom right
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 25),
                      child: Column(
                        children: [
                          // first text block
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Discover new',
                                    style: GoogleFonts.lora(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'see all',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey[300],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Hunt new books before other bookworms do it...',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Books row
                          Container(
                            height: 250,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                BookItemWidget('Milk & Honey',
                                    'assets/images/book1.jpg', 'Rupi Kaur'),
                                BookItemWidget(
                                    'Becoming',
                                    'assets/images/book2.jpeg',
                                    'Michelle Obama'),
                                BookItemWidget('The Engineer',
                                    'assets/images/book3.jpeg', 'Donald Trump'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // second block
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categories',
                              style: GoogleFonts.lora(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'see all',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey[300],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 170,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CategoryItemWidget(
                                'Architecture',
                                208,
                                Icons.architecture,
                              ),
                              CategoryItemWidget(
                                'Design',
                                57,
                                Icons.design_services,
                              ),
                              CategoryItemWidget(
                                'Poem',
                                29,
                                Icons.animation,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // third block
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trending',
                              style: GoogleFonts.lora(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'see all',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookItemWidget extends StatelessWidget {
  String author, name, img;

  BookItemWidget(this.name, this.img, this.author);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 210,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              height: 160,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(img),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey[300],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  String category;
  int number;
  IconData icon;
  Color color = Colors.greenAccent;

  CategoryItemWidget(this.category, this.number, this.icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 130,
      width: 160,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 1,
            offset: Offset(
              1.0,
              4.0,
            ), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 34,
            color: color,
          ),
          Text(
            category,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          Text(
            number.toString() + ' books',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
