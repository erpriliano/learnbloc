part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieUninitialized extends MovieState {}

class MovieError extends MovieState {}

class MovieLoaded extends MovieState {
  final Result result;

  const MovieLoaded({
    this.result,
  });

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'MovieLoaded { result: $result }';
}
