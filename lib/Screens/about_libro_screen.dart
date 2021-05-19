import 'package:book_donation/Services/contributor_service.dart';
import 'package:book_donation/widgets/contributor_tile.dart';
import 'package:flutter/material.dart';

class AboutLibroScreen extends StatelessWidget {
  static const String routeName = '/about-libro';
  @override
  Widget build(BuildContext context) {

    print("About Screen");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Libro",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ContributorService.fetchContributors(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Libro is a book donation app. This app is built using Flutter, using which we can share books with people around us !!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Our Amazing Contributors:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (_, __) => Divider(),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, i) =>
                      ContributorTile(contributor: snapshot.data[i]),
                  itemCount: snapshot.data.length,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Text(
                    'Made in 🇮🇳 with ❤️ by Open-Source',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
