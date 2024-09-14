import 'dart:convert';
import 'dart:io';
import 'package:news_app/api/Result.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/api/model/News.dart';
import 'package:news_app/api/model/Source.dart';
import 'package:news_app/api/model/responses/NewsResponse.dart';
import 'package:news_app/api/model/responses/SourcesResponse.dart';

class EndPoints{
  static const String SOURCES = "v2/top-headlines/sources";
  static const String   NEWS = "v2/everything";
}

class ApiManager{

  static const String BASE_URL = "newsapi.org/";
  static const String API_KEY = "4b0eeb38bf7a4b4bad656927bdf17e9d";
  static Future<Result<List<Source>>> getSourcesByCategoryId(String catId)async{

    var params = {
      "apiKey":API_KEY,
      "category":catId

    };


    try {
      var url = Uri.https(BASE_URL,EndPoints.SOURCES,params);

      var response = await http.get(url , headers: {"X-Api-Key":API_KEY});
      var json = jsonDecode(response.body);
      var sourcesResponse = SourcesResponse.fromJson(json);
      if(sourcesResponse.status == 'ok'){
        return Success(data: sourcesResponse.sources?? []);
      }else{
        return ServerError(sourcesResponse.code??"", sourcesResponse.message??"");
      }




    }on Exception catch(e){
      return Error(e);
    }
  }
  static Future<Result<List<News>>> getNewsBySourceId({String? sourceId, String? query})async{

    var params = {
      "apiKey":API_KEY,
      "sources":sourceId,
      "query":query

    };


    try {
      var url = Uri.https(BASE_URL,EndPoints.NEWS,params);

      var response = await http.get(url , headers: {"X-Api-Key":API_KEY});
      var json = jsonDecode(response.body);
      print("json :$json");
      var newsResponse = NewsResponse.fromJson(json);
      if(newsResponse.status == 'ok'){
        return Success(data: newsResponse.articles ?? []);
      }
      return ServerError(newsResponse.code??"",newsResponse.message??"");



    } on Exception catch(e){
      return Error(e);
    }
  }
}