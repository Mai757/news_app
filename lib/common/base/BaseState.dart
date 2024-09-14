import 'package:news_app/api/Result.dart';

sealed class BaseUIState<T>{}
class ErrorState<T> extends BaseUIState<T>{
  ServerError? serverError;
  Error? error;
  ErrorState({this.serverError,this.error});
}
class SuccessState <T>extends BaseUIState<T>{
  T  data;
  SuccessState(this.data);

}
class LoadingState<T> extends BaseUIState<T>{
  String? message;
  LoadingState([this.message]);
}

