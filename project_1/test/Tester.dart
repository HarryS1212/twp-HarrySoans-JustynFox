import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('I can open my test data', () async {
    String value = await File('test/soup_changes.json').readAsString();
    expect(value,
        startsWith('{"continue":{" "'));
  });

  test('Get username',
          () async {
        final data = await File('test/soup_changes.json').readAsString();

        final dataAsMap = jsonDecode(data);
        final pageData = dataAsMap["query"]["pages"].entries.first.value;
        final answer = pageData["revisions"][0]["user"];
        expect(answer, '');
      });
}

