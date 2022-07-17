class ApiConfing {
  static const _baseUrl = 'https://api.themoviedb.org/3/';
  static const _apiKey = 'bf4ad2afaf16078caf791d27b3fb75ca';

  static Uri gerateUrl(String path) {
    final url = '$_baseUrl$path?api_key=$_apiKey';
    final uri = Uri.parse(url);
    return uri;
  }
}
