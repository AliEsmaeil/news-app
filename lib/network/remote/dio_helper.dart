import 'package:dio/dio.dart';

class DioHelper{
  static late  Dio dio;

  static void initiateDio(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://newsapi.org/',
       // connectTimeout: Duration(seconds: 5),
        //receiveTimeout: Duration(seconds: 8),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> getData({
    required String serverPath,
    required Map<String,dynamic> query,})async
  {

    return await dio.get(serverPath,queryParameters: query);
  }



}