import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movie/movie_event.dart';
import 'package:movies/blocs/movie/movie_state.dart';
import 'package:movies/data/repositories/local/movie_repository.dart';
import 'package:movies/models/movie_model.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  bool isFetching = false;

  MovieBloc({required this.repository}) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      if (isFetching) return;
      isFetching = true;
      try {
        final currentState = state;
        List<MovieModel> oldMovies = [];
        if (currentState is MovieLoaded) {
          oldMovies = currentState.movies;
        }

        final newMovies = await repository.getMovieFromApi();
        final allMovies = oldMovies + newMovies;
        emit(MovieLoaded(movies: allMovies));
      } catch (e) {
        emit(MovieError(message: e.toString()));
      } finally {
        isFetching = false;
      }
    });
  }
}
