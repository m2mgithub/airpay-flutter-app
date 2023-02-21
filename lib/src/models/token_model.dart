// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
    Token({
        this.type,
        this.token,
    });

    String? type;
    String? token;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        type: json["type"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "token": token,
    };
}
