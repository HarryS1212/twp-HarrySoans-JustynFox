import 'dart:convert';

class RevisionParser {
  Map<String, dynamic> parseJsonString(String jsonString) {
    final webpageJsonList =
        jsonDecode(jsonString)["query"]["pages"].entries.first.value;
    return webpageJsonList;
  }
}

class WebpageResponse {
  String webpageName;
  List<Revision> revisionList;
  bool redirectFlag;

  WebpageResponse(
      {required this.webpageName,
        required this.redirectFlag,
        required this.revisionList});

  factory WebpageResponse.fromJson(Map<String, dynamic> parsedJson) {
    var revisionArray = parsedJson["revisions"] as List;
    var revisions = revisionArray.map((e) => Revision.fromJson(e)).toList();

    return WebpageResponse(
      webpageName: parsedJson["title"],
      redirectFlag: false,
      revisionList: revisions,
    );
  }

  String makeWebpageResponse() {
    var revisionListString = makeRevisionString();
    var webpageResponseString =
        'Title: $webpageName \n Redirect: $redirectFlag \n Revisions: $revisionListString';

    return webpageResponseString;
  }

  String makeRevisionString() {
    var revisionListString = '';
    for (Revision revision in revisionList) {
      revisionListString +=
      "\tAuthor: ${revision.user} \n\tTimestamp: ${revision.timestamp} \n";
    }
    return revisionListString;
  }
}

class Revision {
  String timestamp;
  String user;
  Revision({required this.timestamp, required this.user});
  factory Revision.fromJson(Map<String, dynamic> parsedJson) {
    return Revision(
      timestamp: parsedJson["timestamp"],
      user: parsedJson["user"],
    );
  }
}
