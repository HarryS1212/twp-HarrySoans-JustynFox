import 'dart:io';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikipedia Article Revisions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: WikipediaInformationWidget(),
      ),
    );
  }
}

class WikipediaInformationWidget extends StatefulWidget {
  const WikipediaInformationWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WikipediaInformationWidgetState();
}

class _WikipediaInformationWidgetState
    extends State<WikipediaInformationWidget> {
  final _controller = TextEditingController();
  String _message =
      'Enter the name of the Wikipedia article you wish to search';
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              child: TextField(
                controller: _controller,
              )),
          ElevatedButton(
              onPressed: _isProcessing ? null : _onPressed,
              child: const Text('Find!')),
          Text(_message),
        ],
      ),
    );
  }

  void _onPressed() async {
    setState(() {
      _isProcessing = true;
    });
    var jsonString = await File('test/soup_changes.json').readAsString();
    var revisionParser = RevisionParser();
    var jsonList = revisionParser.parseJsonString(jsonString);

    setState(() {
      _message = jsonList.toString();
      _isProcessing = false;
    });
  }
}