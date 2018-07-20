import 'dart:async';

import 'package:movies/model/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayingMovies();
}