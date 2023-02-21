// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.agreeToTerms,
        this.lastUpdated,
    });

    String? id;
    String? name;
    String? email;
    String? phone;
    int? agreeToTerms;
    String? lastUpdated;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        agreeToTerms: json["agree_to_terms"],
        lastUpdated: json["last_updated"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "agree_to_terms": agreeToTerms,
        "last_updated": lastUpdated,
    };
}
