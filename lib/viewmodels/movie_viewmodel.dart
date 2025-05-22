import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/repositories/local/movie_repository.dart';

class MovieEvent {}

class MovieState {}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;
  int page = 1;
  bool isFetching = false;
  MovieBloc({required this.movieRepository}) : super(MovieState());

  @override
  MovieState get initialState => MovieState();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {}
}
