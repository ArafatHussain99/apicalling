import 'package:api_calling_application/movie_search/view/movie_searched_screen.dart';
import 'package:api_calling_application/movie_search/view/search_screen.dart';
import 'package:api_calling_application/pagination/view/pagination_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff131620),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SearchPage.id);
                },
                child: Container(
                  color: const Color(0xffFEC100),
                  child: const Center(
                      child: Text(
                    'Search Movies',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff131620)),
                  )),
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PaginationPage.id);
                },
                child: const Center(
                    child: Text('Scroll through pictures',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFEC100)))),
              ))
        ],
      ),
    );
  }
}
