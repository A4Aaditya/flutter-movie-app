import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_movie_app/models/tv_show.dart';
import 'package:my_movie_app/models/tv_show_details.dart';
import 'package:my_movie_app/service/api_config.dart';

class TvShowApi {
  static Future<List<TvShow>> discover() async {
    const path = 'discover/tv';
    final uri = ApiConfing.gerateUrl(path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    return results.map((e) => TvShow.fromJson(e)).toList();
  }

  static Future<TvShowDetails> fetchMovie(int id) async {
    final path = 'tv/$id';
    final uri = ApiConfing.gerateUrl(path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return TvShowDetails.fromJson(json);
  }
}
