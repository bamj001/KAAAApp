import 'package:flutter/material.dart';
import 'package:kaaa_app/screens/note_list.dart';
import 'package:kaaa_app/screens/alumni_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Color color = const Color(0xff233c5f);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Alumni App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: color
      ),
      home: AlumniList(),
    );
  }
}