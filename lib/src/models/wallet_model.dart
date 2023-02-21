// To parse this JSON data, do
//
//     final wallet = walletFromJson(jsonString);

import 'dart:convert';

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));

String walletToJson(Wallet data) => json.encode(data.toJson());

class Wallet {
    Wallet({
        this.id,
        this.type,
        this.initialBalance,
        this.currentBalance,
        this.previousTransaction,
    });

    String? id;
    String? type;
    int? initialBalance;
    int? currentBalance;
    dynamic previousTransaction;

    factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        type: json["type"],
        initialBalance: json["initial_balance"],
        currentBalance: json["current_balance"],
        previousTransaction: json["previous_transaction"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "initial_balance": initialBalance,
        "current_balance": currentBalance,
        "previous_transaction": previousTransaction,
    };
}
