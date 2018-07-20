import 'dart:async';

import 'package:movies/model/movie.dart';
import 'package:movies/repository/movies_repository.dart';

class MockMoviesRepository implements MoviesRepository {
  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    await Future.delayed(Duration(seconds: 3));
    return movies;
  }
}