import 'package:movies/model/movie.dart';

class FetchMoviesAction {}

class LoadingMoviesAction {}

class MoviesLoadedAction {
  final List<Movie> movies;

  MoviesLoadedAction(this.movies);
}
