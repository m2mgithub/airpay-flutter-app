import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:airpay/src/models/token_model.dart';
import 'package:airpay/src/utilities/app_exception_helper.dart';

class BaseService {
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl+api);
    
    try {
      var response = await http.get(uri);
      return _response(response);
    } on SocketException{
      throw FetchDataException('No internet access');
    }
  }

  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = payloadObj;
    var _headers = {'accept': 'application/json'};

    try {
      var response = await http.post(uri, body: payload, headers: _headers);
      print(response.statusCode);
      return _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _response(http.Response response)
  {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = new Token.fromJson(jsonDecode(response.body));
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