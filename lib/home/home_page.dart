import 'dart:convert';

import 'package:api_calling_application/movie_search/model/model.dart';
import 'package:api_calling_application/movie_search/view/movie_searched_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var movieList = [];
  final dio = Dio();

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Navigator.pushNamed(context, SearchedPage.id,
                  arguments: _searchController.text);
              print(_searchController.text);
            });
          },
          child: Text('Search'),
        ),
      ],
    );
  }
}
