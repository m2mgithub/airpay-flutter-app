import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:airpay/src/models/user_model.dart';
import 'package:airpay/src/utilities/app_exception_helper.dart';

class SendmoneyService {
  static String? _token;

  static getToken() async{
    final _storage = FlutterSecureStorage();
    _token = await _storage.read(key: 'token');
  }

  Future<dynamic> get(String baseUrl, String api) async {
    await getToken();

    var uri = Uri.parse(baseUrl+api);
    var _headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $_token'
    };
    
    try {
      var response = await http.get(uri, headers: _headers);
      return _response(response);
    } on SocketException{
      throw FetchDataException('No internet access');
    }
  }

  dynamic _response(http.Response response)
  {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = new User.fromJson(jsonDecode(response.body));
        return responseJson;
      case 400:
        throw BadRequestException('Error', 'The credentials provided do not match');
      case 401:
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes));
      case 500:
      default:
        throw FetchDataException('Error', 'Error occured whith code : ${response.statusCode}');
    }
  }
}