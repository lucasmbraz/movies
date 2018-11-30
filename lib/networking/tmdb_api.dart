import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/model/movie.dart';

class TMDBApi {
  static final String baseUrl = 'api.themoviedb.org';
  static final String apiKey = '84f5c24ae8ee67c37b0e088ed85c5262';

  final Client client;

  TMDBApi(this.client);

  Future<List<Movie>> getNowPlayingMovies() async {
    final uri = Uri.https(baseUrl, '3/movie/now_playing', {
      'api_key': apiKey,
    });

    final response = await client.get(uri);
    List<Movie> movies = [];
    final moviesJson = json.decode(response.body)['results'];
    moviesJson.forEach((json) => movies.add(Movie.fromJson(json)));
    return movies;
  }
}
