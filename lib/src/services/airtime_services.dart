import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/models/package_model.dart';
import 'package:airpay/src/models/providers_models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AirtimeService {

  static var _token;

  static getToken() async {
    final _storage = FlutterSecureStorage();
    _token = await _storage.read(key: "token");
  }

  static _setHeaders() => {
      // 'content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token'
  };

  static Future<Providers> fetchProviders() async {
    await getToken();
    final response = await http.get(
      Uri.parse(AppConstant.url+'airtimecity/providers/airtime'),
      headers: _setHeaders()
    );

    // print(response.statusCode);

    if(response.statusCode ==200){
      final responsedata = new Providers.fromJson(jsonDecode(response.body));
      return responsedata;
    }else {
      throw Exception('Data not found');
    }
  }

  static Future postRequest(type, package, amount) async{
    await getToken();
    final response = await http.post(
      Uri.parse(AppConstant.url+'request/airtime'),
      headers: _setHeaders(),
      body: {
        'type': type,
        'package': package,
        'amount': amount.toString()
      }
    );
    
    if(response.statusCode == 200 && response.statusCode == 201) {
      return true;
    }else {
      
    }
  }

  static Future<Packages> fetchPackages(slug) async {
    await getToken();
    final response = await http.get(
      Uri.parse(AppConstant.url+'airtimecity/packages/$slug'),
      headers: _setHeaders()
    );

    // print(response.statusCode);

    if(response.statusCode ==200){
      final responsedata = new Packages.fromJson(jsonDecode(response.body));
      return responsedata;
    }else {
      throw Exception('Data not found');
    }
  }
}