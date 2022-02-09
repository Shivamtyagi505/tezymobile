// To parse this JSON data, do
//
//     final invoiceNumberSuggestion = invoiceNumberSuggestionFromJson(jsonString);

import 'dart:convert';

InvoiceNumberSuggestion invoiceNumberSuggestionFromJson(String str) => InvoiceNumberSuggestion.fromJson(json.decode(str));

String invoiceNumberSuggestionToJson(InvoiceNumberSuggestion data) => json.encode(data.toJson());

class InvoiceNumberSuggestion {
    InvoiceNumberSuggestion({
        this.data,
        this.meta,
    });

    InvoiceData data;
    Meta meta;

    factory InvoiceNumberSuggestion.fromJson(Map<String, dynamic> json) => InvoiceNumberSuggestion(
        data: InvoiceData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
    };
}

class InvoiceData {
    InvoiceData({
        this.attributes,
    });

    Attributes attributes;

    factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    Attributes({
        this.lastInvoiceNumber,
        this.nextInvoiceNumberSuggestion,
    });

    String lastInvoiceNumber;
    String nextInvoiceNumberSuggestion;

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
