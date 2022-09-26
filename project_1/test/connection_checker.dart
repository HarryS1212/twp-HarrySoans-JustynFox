import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

Future<void> connectionChecker() async {
  final response = await http.get(Uri.parse(
      'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=$userInput&rvprop=timestamp|user&rvlimit=30&redirects'));

  test('URL returns', () async {
    var responseCode = response.statusCode;
    expect(responseCode, 200);
  });
}