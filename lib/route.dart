import 'package:api_calling_application/pagination/view/pagination_screen.dart';
import 'package:flutter/material.dart';
import 'package:api_calling_application/movie_search/view/movie_searched_screen.dart';
import 'package:api_calling_application/movie_search/view/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MovieResultPage.id:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MovieResultPage(
          search: searchQuery,
        ),
      );
    case SearchPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SearchPage(),
      );
    case PaginationPage.id:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PaginationPage(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist..'),
          ),
        ),
      );
  }
}
