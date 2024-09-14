import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManager.dart';
import 'package:news_app/api/model/News.dart';
import 'package:news_app/api/Result.dart';
import 'package:news_app/common/base/BaseState.dart';
import 'package:news_app/common/base/BaseViewModel.dart';


class NewsViewModel extends BaseViewModel<List<News>> {

  NewsViewModel() :super(LoadingState());

  void getNewsBySourceId(String sourceId) async {
    emit(LoadingState());


    var result = await ApiManager.getNewsBySourceId(sourceId: sourceId);

    switch (result) {
      case Success<List<News>>():
        {
          emit(SuccessState(result.data));
        }
      case ServerError<List<News>>():
        {
          emit(ErrorState(serverError: result));
        }
      case Error<List<News>>():
        {
          emit(ErrorState(error: result));
        }
    }
  }



}






