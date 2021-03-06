import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '6f891a475dee383c23561cb57dffed82';
  String _baseUrl = 'https://api.themoviedb.org';
  String _language = 'es-ES';

  MoviesProvider() {
    print('movies provider init');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('getOnDisplayMovies');
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'apiKey': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData);
  }
}
