import 'package:movies/networking/tmdb_api.dart';
import 'package:movies/redux/actions.dart';
import 'package:movies/redux/app_state.dart';
import 'package:redux/redux.dart';

class MoviesMiddleware extends MiddlewareClass<AppState> {
  final TMDBApi api;

  MoviesMiddleware(this.api);

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    if (action is FetchMoviesAction) {
      await _fetchNowPlayingMovies(next);
    }
  }

  Future _fetchNowPlayingMovies(NextDispatcher next) async {
    next(LoadingMoviesAction());

    try {
      final movies = await api.getNowPlayingMovies();
      next(MoviesLoadedAction(movies));
    } catch (e) {
      print(e.toString());
    }
  }
}
