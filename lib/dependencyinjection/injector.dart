//class Injector {
//  static final Injector _singleton = new Injector._internal();
//
//  final Map<Type, Object> _overrides = Map();
//
//  factory Injector() => _singleton;
//
//  Injector._internal();
//
//  override(Type type, Object object) {
//    _overrides[type] = object;
//  }
//
//  MoviesBloc get moviesBloc {
//    return MoviesBloc(moviesRepository);
//  }
//
//  MoviesRepository get moviesRepository {
//    if (_overrides.containsKey(MoviesRepository)) {
//      return _overrides[MoviesRepository];
//    }
//    return ProductionMoviesRepository();
//  }
//}
