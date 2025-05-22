import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movie/movie_bloc.dart';
import 'package:movies/blocs/movie/movie_event.dart';
import 'package:movies/blocs/movie/movie_state.dart';
import 'package:movies/widgets/movie_tile.dart';
import 'package:movies/config/theme/dark.dart';
import 'package:movies/core/constants/view_constants.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchMovies());

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<MovieBloc>().add(FetchMovies());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dark.backgroundColor,
      appBar: AppBar(
        title: Text(
          ViewConstants.movieList,
          style: TextStyle(color: Dark.textColor),
        ),
        backgroundColor: Dark.backgroundColor,
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieError) {
            return Center(child: Text(state.message));
          }
          if (state is MovieLoaded) {
            return ListView.builder(
              controller: scrollController,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                if (index == state.movies.length - 1) {
                  return const Center(child: CircularProgressIndicator());
                }
                final movie = state.movies[index];
                return MovieTile(movie: movie);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
