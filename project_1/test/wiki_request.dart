import 'package:test/test.dart';

void main() {

  var queries = {
    'Joe Biden':
    'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=Joe Biden&redirects=1&rvprop=timestamp%7Cuser&rvlimit=30',
  };

  group('buildQuery', () {
    for (var query in queries.keys) {
      test('URL is formatted correctly', () {
        var url = wiki_request().buildQuery(query);
        expect(url, queries[query]);
      });
    }
  });
}


