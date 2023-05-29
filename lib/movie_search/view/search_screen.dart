import 'package:api_calling_application/movie_search/view/movie_searched_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchPage extends StatefulWidget {
  static const String id = 'searchScreen';
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final dio = Dio();

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Type any movie name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, MovieResultPage.id,
                    arguments: _searchController.text);
                print(_searchController.text);
              });
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
