import 'package:movies/redux/actions.dart';
import 'package:movies/redux/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoadingMoviesAction) {
    return state.copyWith(status: Status.LOADING);
  }
  if (action is MoviesLoadedAction) {
    return state.copyWith(movies: action.movies, status: Status.SUCCESS);
  }
  return state;
}
