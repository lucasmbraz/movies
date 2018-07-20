import 'package:flutter/material.dart';
import 'package:movies/dependencyinjection/injector.dart';
import 'package:movies/model/movie.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:movies/utils/background.dart';
import 'package:movies/utils/colors.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() {
    return new _MoviesPageState();
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
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
            )
          );
        }).toList()));
  }
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesRepository _repository = Injector().moviesRepository;

  List<Movie> _movies;
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    _inProgress = true;
    _repository.getNowPlayingMovies().then((movies) {
      setState(() {
        _movies = movies;
        _inProgress = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        elevation: 0.0,
        backgroundColor: MovieColors.primary,
      ),
      body: _inProgress ? _progressIndicator() : _body(context),
    );
  }

  Widget _progressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        widget._movieGrid(context),
      ],
    );
  }
}
