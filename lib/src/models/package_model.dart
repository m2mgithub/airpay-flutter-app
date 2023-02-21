// To parse this JSON data, do
//
//     final packages = packagesFromJson(jsonString);

import 'dart:convert';

Packages packagesFromJson(String str) => Packages.fromJson(json.decode(str));

String packagesToJson(Packages data) => json.encode(data.toJson());

class Packages {
    Packages({
        required this.packages,
    });

    List<Package> packages;

    factory Packages.fromJson(Map<String, dynamic> json) => Packages(
        packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
    };
}

class Package {
    Package({
        this.id,
        this.code,
        this.amount,
        this.description,
    });

    String? id;
    String? code;
    int? amount;
    String? description;

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        code: json["code"],
        amount: json["amount"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "amount": amount,
        "description": description,
    };
}

