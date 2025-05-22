import 'package:dio/dio.dart';
import 'package:movies/models/movie_model.dart';

class MovieRepository {
  static int offset = 1;
  static const int pageSize = 10;
  Future<List<MovieModel>> getMovieFromApi() async {
    final response = await Dio().get(
      'https://imdb-top-100-movies.p.rapidapi.com/',
      options: Options(
        headers: {
          'x-rapidapi-host': 'imdb-top-100-movies.p.rapidapi.com',
          'x-rapidapi-key':
              '86808b6481msh6e97cf3c380edcfp10458djsna235c5d40e63',
        },
      ),
    );
    final data = response.data;
    List<MovieModel> movies = [];
    for (int i = offset * pageSize; i < offset * pageSize + pageSize; i++) {
      final movie = MovieModel.fromJson(data[i]);
      movies.add(movie);
    }
    if (offset < 10) {
      offset++;
    } else {
      offset = 1;
    }
    return movies;
  }
}
