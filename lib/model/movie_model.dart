// ignore_for_file: unnecessary_this

class MoviesResults {
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;

  MoviesResults({
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  MoviesResults.fromJson(Map<String, dynamic> json) {
    this.overview = json["overview"].toString();
    this.posterPath = json["poster_path"].toString();
    this.releaseDate = json["release_date"].toString();
    this.title = json["title"].toString();
  }
}

class Movies {
  List<dynamic>? results;

  Movies({
    this.results,
  });

  Movies.fromjson(Map<String, dynamic> json) {
    this.results = (json["results"] as List)
        .map((e) => MoviesResults.fromJson(e))
        .toList();
  }
}
