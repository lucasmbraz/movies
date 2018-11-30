abstract class MoviesRepository {
//  Observable<List<Movie>> getNowPlayingMovies();
}

class ProductionMoviesRepository implements MoviesRepository {
  static const API_KEY = "84f5c24ae8ee67c37b0e088ed85c5262";
  static const MOVIES_URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=$API_KEY";

//  @override
//  Observable<List<Movie>> getNowPlayingMovies() {
//    return Observable.fromFuture(_fetchNowPlayingMovies());
//  }
//
//  Future<List<Movie>> _fetchNowPlayingMovies() async {
//    final response = await http.get(MOVIES_URL);
//
//    if (response.statusCode == 200) {
//      List<Movie> movies = [];
//      final moviesJson = json.decode(response.body)['results'];
//      moviesJson.forEach((json) => movies.add(Movie.fromJson(json)));
//      return movies;
//    }
//
//    throw Exception('Failed to load now playing movies');
//  }
}
