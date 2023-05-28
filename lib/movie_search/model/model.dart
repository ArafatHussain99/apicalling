// To parse this JSON data, do
//
//     final movieList = movieListFromJson(jsonString);

import 'dart:convert';

movieList movieListFromJson(String str) => movieList.fromJson(json.decode(str));

String movieListToJson(movieList data) => json.encode(data.toJson());

class movieList {
  Type searchType;
  String expression;
  List<Result> results;
  String errorMessage;

  movieList({
    required this.searchType,
    required this.expression,
    required this.results,
    required this.errorMessage,
  });

  factory movieList.fromJson(Map<String, dynamic> json) => movieList(
        searchType: typeValues.map[json["searchType"]]!,
        expression: json["expression"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "searchType": typeValues.reverse[searchType],
        "expression": expression,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}

class Result {
  String id;
  Type resultType;
  String image;
  String title;
  String description;

  Result({
    required this.id,
    required this.resultType,
    required this.image,
    required this.title,
    required this.description,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        resultType: typeValues.map[json["resultType"]]!,
        image: json["image"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resultType": typeValues.reverse[resultType],
        "image": image,
        "title": title,
        "description": description,
      };
}

enum Type { MOVIE }

final typeValues = EnumValues({"Movie": Type.MOVIE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
