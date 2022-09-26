import 'dart:io';
import 'package:flutter_test/flutter_test.dart';


Future<void> main() async {
  var jsonString = await File('test/soup_changes.json').readAsString();
  var revisionParser = RevisionParser();
  var jsonList = revisionParser.parseJsonString(jsonString);

  test('parseJsonString() returns JSON list', () async {
    final expectedList = {
      "pageid": 19651298,
      "ns": 0,
      "title": "Soup",
      "revisions": [
        {"user": "Kind Tennis Fan", "timestamp": "2022-08-02T23:32:25Z"},
      ]
    };
    expect(jsonList, expectedList);
  });

  test('generateWebpageResponse() returns webpageResponse string', () {
    var webpageResponse = WebpageResponse.fromJson(jsonList);
    expect(webpageResponse.makeWebpageResponse(), 'test');
  });
}