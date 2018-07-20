import 'package:movies/repository/mock_movies_repository.dart';
import 'package:movies/repository/movies_repository.dart';

enum Flavor { PRODUCTION, MOCK }

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  MoviesRepository get moviesRepository {
    return MockMoviesRepository();
  }
}
