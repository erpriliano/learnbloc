import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  const Result({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results
  });

  @override
  List<Object> get props => [page, totalResults, totalPages, results];

  @override
  String toString() => 'Result { page: $page, total_results: $totalResults, movies: $results }';

}

class Movie extends Equatable {
  final double popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final String overview;
  final String releaseDate;

  const Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.title,
    this.overview,
    this.releaseDate
  });

  @override
  List<Object> get props => [popularity, voteCount, video, posterPath, id, adult, backdropPath, originalLanguage, originalTitle, title, overview, releaseDate];

  @override
  String toString() => 'Movie { popularity: $popularity, voteCount: $voteCount, video: $video, posterPath: $posterPath, id: $id, adult: $adult, backdropPath: $backdropPath, originalLanguage: $originalLanguage, originalTitle: $originalTitle, title: $title, overview: $overview, releaseDate: $releaseDate }';
}