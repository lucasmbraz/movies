import 'package:flutter/material.dart';
import 'package:movies/model/movie.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/background.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        elevation: 0.0,
        backgroundColor: MovieColors.diagonalBackground,
      ),
      body: Stack(
        children: <Widget>[
          Background(),
          _movieGrid(context),
        ],
      ),
    );
  }

  Widget _movieGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: _mainMovie(context)),
          _movies(context),
        ],
      ),
    );
  }

  Widget _mainMovie(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: MovieColors.card,
        child: Image.network(
          movies.first.poster,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.width - 32.0,
        ),
      ),
    );
  }

  Widget _movies(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
      ),
      delegate: SliverChildListDelegate(
        movies.where((movie) => movie != movies[0]).map((Movie movie) {
          return Card(
            color: MovieColors.card,
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
            )
          );
        }).toList()
      )
    );
  }
}
