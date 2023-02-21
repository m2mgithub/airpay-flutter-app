import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:airpay/src/constants/app.dart';
import 'package:airpay/src/models/wallet_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WalletService {
  static var _token;

  static getToken() async{
    final _storage = FlutterSecureStorage();
    _token = await _storage.read(key: 'token');
  }

  static _headers() => {
    'Accept' : 'application/json',
    'Authorization': 'Bearer $_token'
  };

  static Future<Wallet> fetchWallet() async {
    await getToken();
    final response = await http.get(
      Uri.parse(AppConstant.url+'request/wallet'),
      headers: _headers()
    );

    // print(response.reasonPhrase);

    if(response.statusCode == 200){
      final res = new Wallet.fromJson(jsonDecode(response.body));
      return res;
    }else {
      throw Exception('Data not found');
    }
  }
}