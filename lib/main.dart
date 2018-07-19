import 'package:flutter/material.dart';
import 'package:movies/movies/movies_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MoviesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}