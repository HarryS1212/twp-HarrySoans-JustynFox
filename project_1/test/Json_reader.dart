import 'package:test/test.dart';

void main() {
  group('ReadJson', () {
    test('File open and read successfully', () async {
      var json = await JsonReader('c._elegans');
      expect(json['continue'] != null, true);
    });
  });
}

