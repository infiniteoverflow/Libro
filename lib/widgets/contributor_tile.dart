import 'package:book_donation/Models/contributor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContributorTile extends StatelessWidget {
  final Contributor contributor;

  const ContributorTile({
    @required this.contributor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        'Contributions: ${contributor.contributions}',
        style: TextStyle(
          fontFamily: 'IrishGrover',
        ),
      ),
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
          contributor.imageUrl,
        ),
      ),
      title: Text(
        contributor.name,
        style: TextStyle(fontFamily: 'Jua', fontSize: 18),
      ),
      trailing: InkWell(
        onTap: () {
          if (contributor.profileUrl != null) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Are You Sure ?'),
                content: Text(
                    'Do you really wanna go to ${contributor.name}\'s GitHub profile ?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      launch(contributor.profileUrl);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Obviously',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Nope'),
                  ),
                ],
              ),
            );
          }
        },
        child: Image.network(
          'https://img.icons8.com/fluent/50/000000/github.png',
          height: 30,
          width: 30,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
