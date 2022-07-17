import 'package:flutter/material.dart';
import 'package:my_movie_app/models/tv_show.dart';
import 'package:my_movie_app/service/tv_api.dart';
import 'package:my_movie_app/widget/tv_show_card.dart';

class TvShowTab extends StatefulWidget {
  const TvShowTab({Key? key}) : super(key: key);

  @override
  State<TvShowTab> createState() => _TvShowTabState();
}

class _TvShowTabState extends State<TvShowTab> {
  List<TvShow> discoverTvShows = [];

  @override
  void initState() {
    super.initState();
    fetchTvShow();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: discoverTvShows.length,
      itemBuilder: (context, index) {
        final tvshow = discoverTvShows[index];
        return TvShowCard(tvShow: tvshow);
      },
    );
  }

  Future<void> fetchTvShow() async {
    final response = await TvShowApi.discover();
    setState(() {
      discoverTvShows = response;
    });
  }
}
