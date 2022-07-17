import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:my_movie_app/screens/movie/movie_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterUrl = 'http://image.tmdb.org/t/p/w500${movie.posterPath}';
    final movieId = movie.id;
    return InkWell(
      onTap: () => navigateDetailPage(context, movie),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Hero(
                  tag: 'poster-$movieId',
                  child: Image.network(
                    posterUrl,
                    width: 100,
                    height: 150,
                    loadingBuilder: (context, child, loadingProgress) {
                      return Container(
                        color: Colors.grey,
                        child: child,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Hero(
                    tag: 'title-$movieId',
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Hero(
                    tag: 'description-$movieId',
                    child: Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateDetailPage(BuildContext context, Movie movie) {
    final route = MaterialPageRoute(
      builder: (context) {
        return MovieScreen(movie: movie);
      },
    );
    Navigator.push(context, route);
  }
}
