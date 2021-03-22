import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//TODO: Put this constant color
const Color darkBlue = Color(0xFF002253);

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: _height * 0.05),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      'https://i.imgur.com/R2dlljW.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Text(
                    'William John Malik',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: darkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: _height * 0.05),
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 0.5,
            ),
            SizedBox(height: _height * 0.05),
            OptionsTile(
              icon: FontAwesomeIcons.userAlt,
              title: 'Personal Data',
              onTap: () {},
            ),
            OptionsTile(
              icon: FontAwesomeIcons.cog,
              title: 'Settings',
              onTap: () {},
            ),
            OptionsTile(
              icon: FontAwesomeIcons.solidBookmark,
              title: 'Bookmarks',
              onTap: () {},
            ),
            OptionsTile(
              icon: FontAwesomeIcons.solidHeart,
              title: 'Favorites',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const OptionsTile({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ListTile(
        onTap: onTap,
        leading: Card(
          elevation: 3,
          color: Color(0xFFF7F5FB),
          child: SizedBox(
            height: 30,
            width: 30,
            child: Icon(
              icon,
              size: 15,
              color: darkBlue,
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: darkBlue,
                fontWeight: FontWeight.w600,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: darkBlue,
        ),
      ),
    );
  }
}
