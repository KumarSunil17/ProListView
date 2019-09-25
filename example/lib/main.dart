import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pro_listview/pro_listview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<ProListViewState> key = GlobalKey();

  List<String> list = [
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
    'Sunil',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ProListView(
          key: key,
          onRefresh: () {
            final Completer<void> completer = Completer<void>();
            Timer(const Duration(seconds: 3), () {
              completer.complete();
            });
            return completer.future.then<void>((_) {});
          },
          listView: ListView.builder(
            dragStartBehavior: DragStartBehavior.down,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(list[i]),
              );
            },
            itemCount: list.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
