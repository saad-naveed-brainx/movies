import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/viewmodels/movie_viewmodel.dart';
import 'package:movies/views/movie_list_page.dart';
import 'package:movies/data/repositories/local/movie_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository = MovieRepository();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => MovieBloc(movieRepository: movieRepository),
        child: const MovieListPage(),
      ),
    );
  }
}
