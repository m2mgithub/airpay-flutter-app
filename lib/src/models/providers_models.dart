// To parse this JSON data, do
//
//     final providers = providersFromJson(jsonString);

import 'dart:convert';

Providers providersFromJson(String str) => Providers.fromJson(json.decode(str));

String providersToJson(Providers data) => json.encode(data.toJson());

class Providers {
    Providers({
        required this.providers,
    });

    List<Provider> providers;

    factory Providers.fromJson(Map<String, dynamic> json) => Providers(
        providers: List<Provider>.from(json["providers"].map((x) => Provider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "providers": List<dynamic>.from(providers.map((x) => x.toJson())),
    };
}

class Provider {
    Provider({
        this.id,
        this.name,
        this.slug,
        this.type,
    });

    String? id;
    String? name;
    String? slug;
    String? type;

    factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "type": type,
    };
}
