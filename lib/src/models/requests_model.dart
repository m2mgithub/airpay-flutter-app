// To parse this JSON data, do
//
//     final request = requestFromJson(jsonString);

import 'dart:convert';

Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
    Request({
        required this.requests,
    });

    List<RequestElement> requests;

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        requests: List<RequestElement>.from(json["requests"].map((x) => RequestElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "requests": List<dynamic>.from(requests.map((x) => x.toJson())),
    };
}

class RequestElement {
    RequestElement({
        this.id,
        this.type,
        this.amount,
        this.lastUpdated,
    });

    String? id;
    String? type;
    int? amount;
    String? lastUpdated;

    factory RequestElement.fromJson(Map<String, dynamic> json) => RequestElement(
        id: json["id"],
        type: json["type"],
        amount: json["amount"],
        lastUpdated: json["last_updated"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "amount": amount,
        "last_updated": lastUpdated,
    };
}
