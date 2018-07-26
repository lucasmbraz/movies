import 'package:movies/model/movie.dart';
import 'package:rxdart/rxdart.dart';

abstract class MoviesRepository {
  Observable<List<Movie>> getNowPlayingMovies();
}

class ProductionMoviesRepository implements MoviesRepository {
  @override
  Observable<List<Movie>> getNowPlayingMovies() {
    return Observable.timer(null, Duration(seconds: 3)).map((_) => movies);
  }
}
