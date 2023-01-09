import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
      },
    ));
  }

  static Future<Response> GetData(
      {@required String? url,
      Map<String, dynamic>? query,
      String? token}) async {
    // dio!.options.headers = {
    //   'lang': 'en',
    //   'Content-Type': 'application/json',
    //   'Authorization': '$token' ?? '',
    // };
    return await dio!.get(url.toString(),
        queryParameters: query,
        options: Options(headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': '$token' ?? '',
        }));
  }

  static Future<Response> PutData({
    @required String? url,
    Map<String, dynamic>? query,
    String? token,
    @required String? name,
    @required String? phone,
    @required String? email,
  }) async {
    // dio!.options.headers = {
    //   'lang': 'en',
    //   'Content-Type': 'application/json',
    //   'Authorization': '$token' ?? '',
    // };
    return await dio!.put(url.toString(),
        queryParameters: query,
        options: Options(headers: {
          'lang': 'en',
          'Content-Type': 'application/json',
          'Authorization': '$token' ?? '',
        }),
        data: {
          "name": "${name}",
          "phone": "${phone}",
          "email": "${email}",

        });
  }

  static Future<Response> Removetoken(
      {@required String? url,
      Map<String, dynamic>? query,
      String? token}) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '$token' ?? '',
    };
    return await dio!.post(url.toString(), queryParameters: query);
  }

  static Future<Response> PostData(
      {@required String url = "",
      @required String? email,
      @required String? password,
      String? lang = 'en',
      Map<String, dynamic>? Query}) async {
    return dio!.post(
      url,
      data: {
        'email': '$email',
        'password': '$password',
      },
      queryParameters: Query,
    );
  }

  static Future<Response> PostFavorites(
      {@required String url = "",
      int? ProductId,
      String? lang = 'en',
      String? Token}) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': '$Token',
    };
    return dio!.post(
      url,
      data: {'product_id': ProductId},
    );
  }

  static Future<Response> GetDataCategory(
      {@required String? url,
      Map<String, dynamic>? query,
      String? token}) async {
    return await dio!.get(url.toString(), queryParameters: query);
  }

  static Future<Response> PostNewData({
    @required String? url,
    @required String? email,
    @required String? password,
    @required String? phone,
    @required String? name,
  }) async {
    return await dio!.post(url!, data: {
      'email': '$email',
      'password': '$password',
      'phone': '$phone',
      'name': '$name',
    });
  }
}
