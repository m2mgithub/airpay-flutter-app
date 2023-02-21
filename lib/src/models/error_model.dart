// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
    Error({
        this.type,
        this.message,
    });

    String? type;
    String? message;

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        type: json["type"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
    };
}
