class Movie {
  final String id;
  final String poster;

  const Movie(this.id, this.poster);

  @override
  String toString() => "{id=$id, poster=${poster.substring(32)}";
}

List<Movie> movies = [
  Movie("351286", "https://image.tmdb.org/t/p/w500/c9XxwwhPHdaImA2f1WEfEsbhaFB.jpg"),
  Movie("363088", "https://image.tmdb.org/t/p/w500/rv1AWImgx386ULjcf62VYaW8zSt.jpg"),
  Movie("260513", "https://image.tmdb.org/t/p/w500/x1txcDXkcM65gl7w20PwYSxAYah.jpg"),
  Movie("447332", "https://image.tmdb.org/t/p/w500/nAU74GmpUk7t5iklEp3bufwDq4n.jpg"),
  Movie("442249", "https://image.tmdb.org/t/p/w500/2slvblTroiT1lY9bYLK7Amigo1k.jpg"),
  Movie("400155", "https://image.tmdb.org/t/p/w500/gjAFM4xhA5vyLxxKMz38ujlUfDL.jpg"),
  Movie("447200", "https://image.tmdb.org/t/p/w500/3NL1FiTEhU4SWOuWk8lkVCbmnYm.jpg"),
];