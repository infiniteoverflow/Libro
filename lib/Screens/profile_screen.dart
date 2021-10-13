import '../Screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Utils/Styles.dart';

class ProfileScreen extends StatelessWidget {
  User user;
  ProfileScreen(this.user);
  Widget profileCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Styles.profileBar.withAlpha(30),
            blurRadius: 8.0,
            spreadRadius: 8.0,
          ),
        ],
        color: Styles.profileBar,
      ),
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.photoURL ?? 'https://cdn.icon-icons.com/icons2/2120/PNG/512/user_account_person_avatar_icon_131248.png'),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user.displayName,
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 13, color: Colors.white54),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return EditProfileScreen(user);
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), color: Colors.white),
              child: Text(
                'Edit',
                style: TextStyle(color: Styles.profileBar, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profOption(String icon, var heading) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0X95E9EBF0),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ],
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                width: 45,
                height: 45,
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  icon,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(heading,
                  style: TextStyle(
                      fontFamily: 'Jua',
                      fontSize: 17.0,
                      color: Styles.headingColor,
                      height: 1.5,
                      letterSpacing: 0.25)),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25.0, fontFamily: 'Jua'),
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              profileCard(context),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 16),
                    child: Text("GENERAL",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Jua',
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Styles.shadowColor,
                              blurRadius: 10,
                              spreadRadius: 2)
                        ],
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    child: Column(
                      children: <Widget>[
                        profOption("assets/images/person.png", "Personal Data"),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Divider(
                            height: 0.2,
                          ),
                        ),
                        profOption("assets/images/fav.png", "Favourites"),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Divider(
                            height: 0.2,
                          ),
                        ),
                        profOption("assets/images/bookmark.png", "Bookmarks"),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Divider(
                            height: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 16),
                    child: Text("SETTINGS",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Jua',
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Styles.shadowColor,
                              blurRadius: 10,
                              spreadRadius: 2)
                        ],
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    child: Column(
                      children: <Widget>[
                        profOption("assets/images/settings.png", "Settings"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
