import 'package:daily_account/core/resources/exception/app_exception.dart';

/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */


abstract class DataState<T>{
  T? data;
  AppException? error;
  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T>{
  DataSuccess(T data) : super(data: data);
}

class DataFailure<T> extends DataState<T>{
  DataFailure(AppException error) : super(error: error);
}