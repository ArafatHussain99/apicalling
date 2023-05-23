import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class SearchedPage extends StatefulWidget {
  static const String id = 'searched';
  final String search;
  const SearchedPage({super.key, required this.search});

  @override
  State<SearchedPage> createState() => _SearchedPageState();
}

class _SearchedPageState extends State<SearchedPage> {
  var samplejson = [];
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(widget.search),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 370),
                  itemCount: samplejson.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: 100,
                      color: Colors.greenAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            '${samplejson[index]['image']}',
                            height: 250,
                          ),
                          Text(
                            '${samplejson[index]['title']}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Description: ${samplejson[index]['description']}',
                            style: TextStyle(fontSize: 10),
                            maxLines: 1,
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<dynamic>> getData(String string) async {
    try {
      final response = await dio
          .get('https://imdb-api.com/en/API/SearchMovie/k_s16v04m7/${string}');
      print('https://imdb-api.com/en/API/SearchMovie/k_s16v04m7/${string}');
      if (response.statusCode == 200) {
        print(response);
        samplejson = response.data['results'] as List;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return samplejson;
    // final response = await http.get(Uri.parse(
    //     'https://imdb-api.com/en/API/SearchMovie/k_s16v04m7/spiderman'));
    // var data = jsonDecode(response.body.toString());
    // if (data['results'] != null) {
    //   samplejson = [];
    //   data['results'].forEach((v) {
    //     samplejson.add(Result.fromJson(v));
    //   });
    // }
    // print(samplejson.runtimeType);
    // return samplejson;

    // if (response.statusCode == 200) {
    //   samplejson.add(Result.fromJson(data['results']));
    //   return results;
    // } else {
    //   return samplejson;
    // }
  }
}
