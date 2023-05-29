import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MovieSearchController {
  final dio = Dio();
  var movieList = [];
  Future<List<dynamic>> getData(String string) async {
    try {
      final response = await dio
          .get('https://imdb-api.com/en/API/SearchMovie/k_s16v04m7/${string}');
      if (response.statusCode == 200) {
        print(response);
        movieList = response.data['results'];
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return movieList;
    // final response = await http.get(Uri.parse(
    //     'https://imdb-api.com/en/API/SearchMovie/k_s16v04m7/spiderman'));
    // var data = jsonDecode(response.body.toString());
    // if (data['results'] != null) {
    //   movieList = [];
    //   data['results'].forEach((v) {
    //     movieList.add(Result.fromJson(v));
    //   });
    // }
    // print(movieList.runtimeType);
    // return movieList;

    // if (response.statusCode == 200) {
    //   movieList.add(Result.fromJson(data['results']));
    //   return results;
    // } else {
    //   return movieList;
    // }
  }
}
