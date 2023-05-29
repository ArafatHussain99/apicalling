import 'dart:convert';

import 'package:api_calling_application/pagination/controller/pagiantion_controller.dart';
import 'package:api_calling_application/pagination/model/pagination_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PaginationPage extends StatefulWidget {
  static const String id = 'pagination';
  const PaginationPage({super.key});

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  final scrollController = ScrollController();
  var itemList = [];
  late Future<List<dynamic>> futureList;
  int pageNumber = 1;
  PaginationController paginationController = PaginationController();
  // @override
  // void initState() {
  //   super.initState();
  //   paginationController.fetchMyItems(context: context);
  // }
  @override
  void initState() {
    super.initState();
    futureList = fetchMyItems();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131620),
      body: FutureBuilder(
          future: futureList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                controller: scrollController,
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black38,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                itemList[index]['urls']['full'],
                                fit: BoxFit.fitWidth,
                              ),
                              // Text(
                              //   '${itemList[index]['urls']['full']}',
                              //   style:
                              //       TextStyle(fontSize: 20, color: Colors.white),
                              // ),
                              Text(
                                '${itemList[index]['alt_description']}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                'Uploaded by: ${itemList[index]['user']['username']}',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffFEC100)),
                              )
                            ]),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  final dio = Dio();
  Future<List<dynamic>> fetchMyItems() async {
    try {
      final response = await dio.get(
          'https://api.unsplash.com/photos?client_id=hPSQCfVZebpEj2WS2HigwVWdJI0enunWH8O5xWSp6Ko&page=$pageNumber&per_page=4');
      print(
          'https://api.unsplash.com/photos?client_id=hPSQCfVZebpEj2WS2HigwVWdJI0enunWH8O5xWSp6Ko&page=$pageNumber&per_page=4');
      if (response.statusCode == 200) {
        itemList.addAll(response.data as List);
        print(itemList.length);
      }
      if (pageNumber != 1) {
        futureList = appendElements(futureList, response.data);
      }

      // var data = jsonDecode(response.data.toString());
      // if (response.statusCode == 200) {
      //   for (Map<String, dynamic> index in data) {
      //     itemList.add(PaginationModel.fromJson(index));
      //   }
      //   print(itemList);
      // }
    } catch (e) {
      print(e);
    }
    return itemList;
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      pageNumber += 1;
      fetchMyItems();
    }
  }

  Future<List<dynamic>> appendElements(
      Future<List<dynamic>> listFuture, List<dynamic> elementsToAdd) async {
    final list = await listFuture;
    list.addAll(elementsToAdd);
    return list;
  }
}
