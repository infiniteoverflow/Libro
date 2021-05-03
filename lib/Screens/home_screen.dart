import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './chat_screen.dart';
import './profile_screen.dart';
import './notifs_screen.dart';
import './about_libro_screen.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../router/route_constants.dart';
// import 'package:book_donation/Services/google_sign_in.dart';
// import 'intro_screen.dart';
// import 'package:book_donation/Services/facebook_sign_in.dart';

class HomeScreen extends StatefulWidget {
  final bool isFacebookSignIn;

  const HomeScreen({this.isFacebookSignIn});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentBackPressTime;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool _isLoggedin = false;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "Press again to exit",
      );
      return Future.value(false);
    }
    Fluttertoast.cancel();
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

//functions required for signout
  @override
  void initState() {
    checkAuthentication();
    getuser();
    super.initState();
  }

  signOut() async {
    await _auth.signOut();
  }

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(
          context,
          "/introduction-screen",
        );
      }
    });
  }

  getuser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        _isLoggedin = true;
      });
    }
  }

  //end of functions for signout

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double _height = _mediaQueryData.size.height;
    double _width = _mediaQueryData.size.width;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          //automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.only(right: 13),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: const TextField(
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
        ),
        drawer: MainDrawer(signOut),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                spreadRadius: 1,
                offset: Offset(
                  0.0,
                  5.0,
                ),
              ),
            ],
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          width: _width * 0.9,
          height: 60,
          child: Row(
            children: [
              // Chat Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChatScreen();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Icon(
                          Icons.chat_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Chat',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Profile Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProfileScreen();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Notifications Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return NotifsScreen();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Notifs',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
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
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    // first block
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
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
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
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
                              const SizedBox(
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
                          const SizedBox(
                            height: 20,
                          ),
                          // Books row
                          SizedBox(
                            height: 250,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                BookItemWidget(
                                  'Milk & Honey',
                                  'assets/images/book1.jpg',
                                  'Rupi Kaur',
                                ),
                                BookItemWidget(
                                  'Becoming',
                                  'assets/images/book2.jpeg',
                                  'Michelle Obama',
                                ),
                                BookItemWidget(
                                  'The Engineer',
                                  'assets/images/book3.jpeg',
                                  'Donald Trump',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
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
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 170,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
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
                    const SizedBox(
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
                            const Text(
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
                          decoration: const BoxDecoration(
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
  final String author, name, img;

  const BookItemWidget(this.name, this.img, this.author);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 210,
      margin: const EdgeInsets.symmetric(
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
          SizedBox(
            width: 120,
            child: Text(
              author,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[300],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 120,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final String category;
  final int number;
  final IconData icon;

  const CategoryItemWidget(this.category, this.number, this.icon);

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.greenAccent;

    // TODO: implement build
    return Container(
      height: 130,
      width: 160,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          Text(
            '${number.toString()} books',
            style: const TextStyle(
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

class MainDrawer extends StatelessWidget {
  Function signOut;

  MainDrawer(this.signOut);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                child: Text("AS"),
                backgroundColor: Colors.white,
              ),
              title: Text(
                "Ananth Sai",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                "ananth@gmail.com",
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Spacer(),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 26,
            ),
            title: Text(
              "About Libro",
              style: TextStyle(
                fontSize: 24,
                //fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AboutLibroScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 26,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 24,
                //fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              signOut();
            },
          ),
        ],
      ),
    );
  }
}
