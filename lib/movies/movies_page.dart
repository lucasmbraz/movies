import 'package:flutter/material.dart';
import 'package:movies/dependencyinjection/injector.dart';
import 'package:movies/model/movie.dart';
import 'package:movies/movies/movies_bloc.dart';
import 'package:movies/utils/colors.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        elevation: 0.0,
        backgroundColor: MovieColors.primary,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final bloc = Injector().moviesBloc;
    return StreamBuilder<MoviesViewState>(
      stream: bloc.viewState,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container();
        }
        if (snapshot.data.isLoading) {
          return _progressIndicator();
        }
        if (snapshot.data.error != null) {
          return SadPath(snapshot.data.error);
        }
        if (snapshot.data.movies.isEmpty) {
          return SadPath("No movies found.");
        }
        return _movieGrid(context, snapshot.data.movies);
      },
    );
  }

  Widget _progressIndicator() => Center(child: CircularProgressIndicator());

  Widget _movieGrid(BuildContext context, List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(child: _mainMovie(context, movies.first)),
          _theMovies(context, movies),
        ],
      ),
    );
  }

  Widget _mainMovie(BuildContext context, Movie movie) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        child: Image.network(
          movie.poster,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.width - 32.0,
        ),
      ),
    );
  }

  Widget _theMovies(BuildContext context, List<Movie> movies) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildListDelegate(
            movies.where((movie) => movie != movies[0]).map((movie) {
              return Card(
                  child: Image.network(
                    movie.poster,
                    fit: BoxFit.cover,
                  )
              );
            }).toList()));
  }
}

class SadPath extends StatelessWidget {
  final String _message;

  SadPath(this._message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_message, style: Theme.of(context).textTheme.display1, textAlign: TextAlign.center,),
    );
  }
}
