import 'package:flutter/material.dart';
import 'package:todo_list_flutter/src/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue, useMaterial3: false),
      home: HomePage(),
    );
  }
}
