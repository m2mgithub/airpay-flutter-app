import 'dart:convert';

import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/utilities/app_exception_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CashinService {
  static String? _token;

  static getToken() async{
    final _storage = FlutterSecureStorage();
    _token = await _storage.read(key: 'token');
  }

  static _setHeaders() => {
      // 'content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token'
  };

  Future<dynamic> postRequest(phone, type, total) async {
    await getToken();
    var body = {
      'initiator': phone,
      'type': 'Cash in',
      'amount': total
    };
    
    // final response = await http.post(
    //   Uri.parse(AppConstant.url+'request/init'),
    //   body: body,
    //   headers: _setHeaders(),
    // );

    // print(response.statusCode);

    try {
      var response = await http.post(
        Uri.parse(AppConstant.url+'request/init'),
        body: body,
        headers: _setHeaders(),
      );
      return _response(response);
    } catch (e) {
    }
  }

  dynamic _response(http.Response response)
  {
    switch (response.statusCode) {
      case 200:
      case 201:
        // var responseJson = utf8.decode(response.bodyBytes);
        var responseJson = {
          "type": "Success",
          "message": "Successfully made a request"
        };
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