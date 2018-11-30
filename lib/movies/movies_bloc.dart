//class MoviesViewState {
//  final bool isLoading;
//  final String error;
//  final List<Movie> movies;
//
//  const MoviesViewState({this.isLoading = false, this.error, this.movies});
//
//  @override
//  String toString() => "{loading=$isLoading, error=$error, movies=$movies}";
//}
//
//class MoviesBloc {
//  final MoviesRepository _repository;
//  final _subject = BehaviorSubject<MoviesViewState>();
//
//  MoviesBloc(this._repository) {
//    _subject.addStream(_repository.getNowPlayingMovies()
//        .map((movies) {
//          if (movies.isEmpty) {
//            return MoviesViewState(error: "No movies found.");
//          }
//          return MoviesViewState(movies: movies);
//        })
//        .startWith(MoviesViewState(isLoading: true))
//        .onErrorReturnWith((e) {
//          print(e);
//          return MoviesViewState(error: "Something wrong happened. Please try again later.");
//        })
//    );
//  }
//
//  Stream<MoviesViewState> get viewState => _subject.stream;
//}
