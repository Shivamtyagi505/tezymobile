// To parse this JSON data, do
//
//     final addCustomerModel = addCustomerModelFromJson(jsonString);

import 'dart:convert';

AddCustomerModel addCustomerModelFromJson(String str) => AddCustomerModel.fromJson(json.decode(str));

String addCustomerModelToJson(AddCustomerModel data) => json.encode(data.toJson());

class AddCustomerModel {
    AddCustomerModel({
        this.data,
        this.meta,
    });

    Data? data;
    Meta? meta;

    factory AddCustomerModel.fromJson(Map<String, dynamic> json) => AddCustomerModel(
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
        required this.id,
        required this.attributes,
    });

    int id;
    Attributes attributes;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    Attributes({
        this.name,
        this.mobile,
        this.createdAt,
        this.updatedAt,
        this.shopEmail,
        this.shopUniqueId,
    });

    String? name;
    String? mobile;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? shopEmail;
    String? shopUniqueId;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        mobile: json["mobile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        shopEmail: json["shopEmail"],
        shopUniqueId: json["shopUniqueId"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "shopEmail": shopEmail,
        "shopUniqueId": shopUniqueId,
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}
