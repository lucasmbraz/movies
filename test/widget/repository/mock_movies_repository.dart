import 'package:movies/model/movie.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MockMoviesRepository implements MoviesRepository {
  List<Movie> _movies = [];
  Exception _exception;

  @override
  Observable<List<Movie>> getNowPlayingMovies() {
    if (_exception != null) {
      return Observable.error(_exception);
    }

    return Observable.timer(null, Duration(seconds: 1)).map((_) => _movies);
  }

  respondWith(List<Movie> movies) {
    _movies = movies;
  }

  throwException(Exception exception) {
    _exception = exception;
  }
}
