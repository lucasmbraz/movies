import 'dart:async';

import 'package:movies/model/movie.dart';
import 'package:movies/repository/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesViewState {
  final bool isLoading;
  final String error;
  final List<Movie> movies;

  const MoviesViewState({this.isLoading = false, this.error, this.movies});

  @override
  String toString() => "{loading=$isLoading, error=$error, movies=$movies}";
}

class MoviesBloc {
  final MoviesRepository _repository;
  final _subject = BehaviorSubject<MoviesViewState>();

  MoviesBloc(this._repository) {
    _subject.addStream(_repository.getNowPlayingMovies()
        .map((movies) => MoviesViewState(movies: movies))
        .startWith(MoviesViewState(isLoading: true))
        .onErrorReturnWith((e) {
          print(e);
          return MoviesViewState(error: "Something wrong happened. Please try again later.");
        })
    );
  }

  Stream<MoviesViewState> get viewState => _subject.stream;
}