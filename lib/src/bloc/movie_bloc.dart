import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learnbloc/src/model/movie-model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final http.Client httpClient;

  MovieBloc({@required this.httpClient});

  @override
  MovieState get initialState => MovieUninitialized();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is Fetch) {
      final movies = await _fetchPost();
      yield MovieLoaded(result: movies);
    }
  }

  Future<Result> _fetchPost() async {
    final response = await httpClient.get('http://api.themoviedb.org/3/movie/popular?api_key=ee2a50d4e02a3dc3caca82c76ae869d9');

    if(response.statusCode == 200) {
      final data = json.decode(response.body);
      final movies = data['results'] as List;

      return Result(
        page: data['page'],
        totalPages: data['total_pages'],
        totalResults: data['total_results'],
        results: movies.map((movie) {
          return Movie(
            popularity: movie['popularity'],
            voteCount: movie['vote_count'],
            video: movie['video'],
            posterPath: movie['poster_path'],
            id: movie['id'],
            adult: movie['adult'],
            backdropPath: movie['backdrop_path'],
            originalLanguage: movie['original_language'],
            originalTitle: movie['original_title'],
            title: movie['title'],
            overview: movie['overview'],
            releaseDate: movie['release_date']
          );
        }).toList(),
      );
    } else {
      throw Exception('error fetching data');
    }
  }
}
