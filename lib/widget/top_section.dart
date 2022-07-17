import 'package:flutter/material.dart';
import 'package:my_movie_app/widget/flight_shuttle.dart';

class TopSection extends StatelessWidget {
  final String backdropUrl;
  final String posterUrl;
  final String title;
  final int id;

  const TopSection({
    Key? key,
    required this.backdropUrl,
    required this.posterUrl,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 80,
            left: 0,
            right: 0,
            child: Image.network(
              backdropUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 80,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 30,
            child: Hero(
              tag: 'poster-$id',
              child: Image.network(
                posterUrl,
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 230,
            left: 160,
            right: 0,
            child: Hero(
              tag: 'title-$id',
              flightShuttleBuilder: flightShuttleBuilder,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
