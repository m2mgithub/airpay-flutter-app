import 'dart:convert';
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProfileService{
  static var _token;

  static getToken() async{
    final _storage = FlutterSecureStorage();
    _token = await _storage.read(key: 'token');
  }

  static _headers() => {
    'Accept' : 'application/json',
    'Authorization': 'Bearer $_token'
  };

  static Future<User> fetchProfile() async{
    await getToken();

    final response = await http.get(
      Uri.parse(AppConstant.url+'request/profile'),
      headers: _headers()
    );

    if(response.statusCode == 200){
      final res = new User.fromJson(jsonDecode(response.body));
      return res;
    }else {
      throw Exception('Data not found');
    }
  }
}