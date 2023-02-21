import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/models/requests_model.dart';
import 'package:airpay/src/utilities/app_exception_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RequestService{
  static String? _token;

  static getToken() async {
    final _storage = FlutterSecureStorage();
    _token = await _storage.read(key: "token");
  }

  static _setHeaders() => {
      // 'content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token'
  };

  static Future<Request> fetchRecentRequests() async {
    await getToken();

    final response = await http.get(
      Uri.parse(AppConstant.url+'recent/requests'),
      headers: _setHeaders()
    );

    if(response.statusCode == 200){
      final responsedata = new Request.fromJson(jsonDecode(response.body));
      return responsedata;
    } else {
      throw Exception('Data not found');
    }
  }

  static Future<Request> fetchAllRequests() async {
    await getToken();

    final response = await http.get(
      Uri.parse(AppConstant.url+'request/all'),
      headers: _setHeaders()
    );

    if(response.statusCode == 200){
      final responsedata = new Request.fromJson(jsonDecode(response.body));
      return responsedata;
    } else {
      throw Exception('Data not found');
    }
  }

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
    await getToken();

    var uri = Uri.parse(baseUrl + api);
    var payload = payloadObj;
    
    var _headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $_token'
    };

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
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException('Error', 'The credentials provided do not match');
      case 401:
      case 403:
        throw UnAuthorizedException('Error', 'Unauthorized.');
      case 500:
      default:
        throw FetchDataException('Error', 'Error occured whith code : ${response.statusCode}');
    }
  }
}