import 'package:meta/meta.dart';
import 'package:movies/model/movie.dart';

class AppState {
  final List<Movie> movies;
  final Status status;

  AppState({@required this.movies, @required this.status});

  factory AppState.initial() {
    return AppState(movies: [], status: Status.IDLE);
  }

  @override
  String toString() {
    return "status=$status, movies=$movies";
  }

  AppState copyWith({List<Movie> movies, Status status}) {
    return AppState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }
}

enum Status { IDLE, LOADING, SUCCESS, ERROR }
