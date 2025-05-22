import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movie/movie_bloc.dart';
import 'package:movies/views/movie_list_page.dart';
import 'package:movies/data/repositories/local/movie_repository.dart';
import 'package:movies/config/theme/dark.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository = MovieRepository();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Dark.backgroundColor),
      ),
      home: BlocProvider(
        create: (context) => MovieBloc(repository: movieRepository),
        child: const MovieListPage(),
      ),
    );
  }
}
