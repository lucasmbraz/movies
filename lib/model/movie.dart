class Movie {
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w342";

  final int id;
  final String poster;

  const Movie(this.id, this.poster);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      "$imageBaseUrl${json['poster_path']}"
    );
  }

  @override
  String toString() => "{id=$id, poster=${poster.substring(32)}";
}