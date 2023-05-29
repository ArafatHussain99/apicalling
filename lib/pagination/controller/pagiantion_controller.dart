import 'dart:convert';

import 'package:api_calling_application/pagination/model/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PaginationController {
  final dio = Dio();
  Future<List<PaginationModel>> fetchMyItems(
      {required BuildContext context}) async {
    List<PaginationModel> itemList = [];
    try {
      final response = await dio.get(
          'https://api.unsplash.com/photos?client_id=hPSQCfVZebpEj2WS2HigwVWdJI0enunWH8O5xWSp6Ko&page=1&per_page=3');
      var data = jsonDecode(response.data.toString());
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          itemList.add(PaginationModel.fromJson(index));
        }
        print(itemList);
      }
    } catch (e) {
      print(e);
    }
    return itemList;
  }
}
