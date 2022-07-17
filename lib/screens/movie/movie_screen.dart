import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:my_movie_app/widget/flight_shuttle.dart';
import 'package:my_movie_app/widget/top_section.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;
  const MovieScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'http://image.tmdb.org/t/p/w500${widget.movie.posterPath}';
    final backdropUrl =
        'http://image.tmdb.org/t/p/w500${widget.movie.backdropPath}';
    final title = widget.movie.title;
    final description = widget.movie.overview;
    final movieId = widget.movie.id;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: ListView(
        children: [
          TopSection(
            backdropUrl: backdropUrl,
            posterUrl: posterUrl,
            title: title,
            id: movieId,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: 'description-$movieId',
              flightShuttleBuilder: flightShuttleBuilder,
              child: Text(
                description,
                style: const TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
