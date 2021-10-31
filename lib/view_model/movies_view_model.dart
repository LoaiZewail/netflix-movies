import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:movies/model/movie_model.dart';

class MoviesViewModel extends GetxController {
  getPopular() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=833625f97c364f355b022e6ef194a3a6&language=en-US&page=1');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Movies.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('Can Not Load Data', e.toString());
      }
    }
  }

  getTopRated() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=833625f97c364f355b022e6ef194a3a6&language=en-US&page=1');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Movies.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('Can Not Load Data', e.toString());
      }
    }
  }

  getNowPlaying() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=833625f97c364f355b022e6ef194a3a6&language=en-US&page=1');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Movies.fromjson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('Can Not Load Data', e.toString());
      }
    }
  }
}
