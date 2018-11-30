import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:movies/movies/movies_page.dart';
import 'package:movies/networking/tmdb_api.dart';
import 'package:movies/redux/app_state.dart';
import 'package:movies/redux/movies_middleware.dart';
import 'package:movies/redux/reducers.dart';
import 'package:movies/utils/colors.dart';
import 'package:redux/redux.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [MoviesMiddleware(TMDBApi(Client()))],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: new ThemeData(
            primaryColor: MovieColors.primary,
            accentColor: MovieColors.primaryDark,
            cardColor: MovieColors.primaryDark),
        home: new MoviesPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
