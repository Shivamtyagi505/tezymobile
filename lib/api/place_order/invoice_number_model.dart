// To parse this JSON data, do
//
//     final invoiceNumber = invoiceNumberFromJson(jsonString);

import 'dart:convert';

InvoiceNumber invoiceNumberFromJson(String str) => InvoiceNumber.fromJson(json.decode(str));

String invoiceNumberToJson(InvoiceNumber data) => json.encode(data.toJson());

class InvoiceNumber {
    InvoiceNumber({
        this.data,
        this.meta,
    });

    Data? data;
    Meta? meta;

    factory InvoiceNumber.fromJson(Map<String, dynamic> json) => InvoiceNumber(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "meta": meta!.toJson(),
    };
}

class Data {
    Data({
        this.attributes,
    });

    Attributes? attributes;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes!.toJson(),
    };
}

class Attributes {
    Attributes({
        this.lastInvoiceNumber,
        this.nextInvoiceNumberSuggestion,
    });

    String? lastInvoiceNumber;
    String? nextInvoiceNumberSuggestion;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        lastInvoiceNumber: json["lastInvoiceNumber"],
        nextInvoiceNumberSuggestion: json["nextInvoiceNumberSuggestion"],
    );

    Map<String, dynamic> toJson() => {
        "lastInvoiceNumber": lastInvoiceNumber,
        "nextInvoiceNumberSuggestion": nextInvoiceNumberSuggestion,
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}
