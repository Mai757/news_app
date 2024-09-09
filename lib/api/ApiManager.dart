import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/api/model/responses/NewsResponse.dart';
import 'package:news_app/api/model/responses/SourcesResponse.dart';

class EndPoints{
  static const String SOURCES = "v2/top-headlines/sources";
  static const String   NEWS = "v2/everything";
}

class ApiManager{

  static const String BASE_URL = "newsapi.org/";
  static const String API_KEY = "4b0eeb38bf7a4b4bad656927bdf17e9d";
  static Future<SourcesResponse?> getSourcesByCategoryId(String catId)async{

    var params = {
      "apiKey":API_KEY,
      "category":catId

    };

    var url = Uri.https(BASE_URL,EndPoints.SOURCES,params);
    try {
      var response = await http.get(url , headers: {"X-Api-Key":API_KEY});
      var json = jsonDecode(response.body);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;

    } on SocketException {

    } on HttpException {

    } on FormatException {
    }
    return null;

  }
  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{

    var params = {
      "apiKey":API_KEY,
      "sources":sourceId

    };

    var url = Uri.https(BASE_URL,EndPoints.NEWS,params);
    try {
      var response = await http.get(url , headers: {"X-Api-Key":API_KEY});
      var json = jsonDecode(response.body);
      print("json :$json");
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;

    } on SocketException {

    } on HttpException {

    } on FormatException {
    }
    return null;

  }
}