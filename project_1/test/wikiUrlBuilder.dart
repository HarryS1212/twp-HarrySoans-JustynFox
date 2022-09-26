import 'package:http/http.dart' as http;

class RetrieveFromWiki {
  static Future getData(userInput) {
    return http.get(Uri.parse(
        "https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$userInput&rvprop=timestamp|user&rvlimit=30&redirects"));
  }
}
