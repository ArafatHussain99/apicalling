import 'dart:convert';

import 'package:api_calling_application/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Result> samplejson = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    color: Colors.greenAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Image: ${samplejson[index].id}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Title: Title',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Description: description',
                          style: TextStyle(fontSize: 18),
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
        });
  }

  Future<List<Result>> getData() async {
    final response = await http.get(Uri.parse(
        'https://imdb-api.com/en/API/SearchMovie/k_s16v04m7/spiderman'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplejson.add(Result.fromJson(index));
      }
      return samplejson;
    } else {
      return samplejson;
    }
  }
}
