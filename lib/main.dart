import 'package:flutter/material.dart';
import 'package:movies/movies/movies_page.dart';
import 'package:movies/utils/colors.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: MovieColors.primary,
        accentColor: MovieColors.primaryDark,
        cardColor: MovieColors.primaryDark
      ),
      home: new MoviesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
