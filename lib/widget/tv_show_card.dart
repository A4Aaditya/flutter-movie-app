import 'package:flutter/material.dart';
import 'package:my_movie_app/models/tv_show.dart';
import 'package:my_movie_app/screens/tv_show/tv_show_screen.dart';

class TvShowCard extends StatelessWidget {
  final TvShow tvShow;
  const TvShowCard({
    Key? key,
    required this.tvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterUrl = 'http://image.tmdb.org/t/p/w500${tvShow.posterPath}';
    final tvShowId = tvShow.id;
    return InkWell(
      onTap: () => navigateDetailPage(context, tvShow),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Hero(
                  tag: 'poster-$tvShowId',
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
                    tag: 'title-$tvShowId',
                    child: Text(
                      tvShow.name,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Hero(
                    tag: 'description-$tvShowId',
                    child: Text(
                      tvShow.overview,
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

  void navigateDetailPage(BuildContext context, TvShow tvShow) {
    final route = MaterialPageRoute(
      builder: (context) {
        return TvShowScreen(tvShow: tvShow);
      },
    );
    Navigator.push(context, route);
  }
}
