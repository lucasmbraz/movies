import 'package:movies/model/movie.dart';
import 'package:movies/repository/movies_repository.dart';
//import 'package:rxdart/rxdart.dart';

class FakeMoviesRepository implements MoviesRepository {
  static const SAMPLE_MOVIES = [
    Movie(351286, "https://image.tmdb.org/t/p/w342/c9XxwwhPHdaImA2f1WEfEsbhaFB.jpg"),
    Movie(363088, "https://image.tmdb.org/t/p/w342/rv1AWImgx386ULjcf62VYaW8zSt.jpg"),
    Movie(260513, "https://image.tmdb.org/t/p/w342/x1txcDXkcM65gl7w20PwYSxAYah.jpg"),
    Movie(447332, "https://image.tmdb.org/t/p/w342/nAU74GmpUk7t5iklEp3bufwDq4n.jpg"),
    Movie(442249, "https://image.tmdb.org/t/p/w342/2slvblTroiT1lY9bYLK7Amigo1k.jpg"),
    Movie(400155, "https://image.tmdb.org/t/p/w342/gjAFM4xhA5vyLxxKMz38ujlUfDL.jpg"),
    Movie(447200, "https://image.tmdb.org/t/p/w342/3NL1FiTEhU4SWOuWk8lkVCbmnYm.jpg"),
  ];

  List<Movie> _movies = [];
  Exception _exception;

//  @override
//  Observable<List<Movie>> getNowPlayingMovies() {
//    if (_exception != null) {
//      return Observable.error(_exception);
//    }
//
//    return Observable.timer(null, Duration(seconds: 1)).map((_) => _movies);
//  }

  respondWith(List<Movie> movies) {
    _movies = movies;
  }

  throwException(Exception exception) {
    _exception = exception;
  }
}
