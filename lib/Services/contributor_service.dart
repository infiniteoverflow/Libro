import 'dart:convert';
import 'package:book_donation/Models/contributor.dart';
import 'package:http/http.dart' as http;

class ContributorService {
  static Future<List<Contributor>> fetchContributors() async {
    final List<Contributor> listOfContributors = [];
    final contributorsUrl =
        'https://api.github.com/repos/infiniteoverflow/Libro/contributors';
    Uri uri = Uri.parse(contributorsUrl);
    final http.Response response = await http.get(uri);
    var fetchedData = jsonDecode(response.body);
    fetchedData.forEach(
      (element) {
        listOfContributors.add(
          Contributor(
            contributions: element['contributions'],
            imageUrl: element['avatar_url'],
            name: element['login'],
            profileUrl: element['html_url'],
          ),
        );
      },
    );
    return listOfContributors;
  }
}
