import 'package:api_calling_application/movie_search/controller/movie_search_controller.dart';
import 'package:flutter/material.dart';

class SearchedPage extends StatefulWidget {
  static const String id = 'searched';
  final String search;
  const SearchedPage({super.key, required this.search});

  @override
  State<SearchedPage> createState() => _SearchedPageState();
}

class _SearchedPageState extends State<SearchedPage> {
  var movieList = [];
  final MovieSearchController movieSearchController = MovieSearchController();
  late Future<List<dynamic>> listFuture;
  @override
  void initState() {
    super.initState();
    listFuture = getList();
    movieList.addAll(listFuture as List);
  }

  Future<List<dynamic>> getList() async {
    return await movieSearchController.getData(widget.search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: listFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 370),
                  itemCount: movieList.length,
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
                            '${movieList[index]['image']}',
                            height: 250,
                          ),
                          Text(
                            '${movieList[index]['title']}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Description: ${movieList[index]['description']}',
                            style: const TextStyle(fontSize: 10),
                            maxLines: 1,
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
