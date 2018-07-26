import 'package:flutter/material.dart';
import 'package:movies/movies/movies_bloc.dart';

class MoviesProvider extends InheritedWidget {
  final MoviesBloc _moviesBloc;

  MoviesProvider({Key key, @required MoviesBloc moviesBloc, @required Widget child})
      : _moviesBloc = moviesBloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MoviesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MoviesProvider) as MoviesProvider)._moviesBloc;
}