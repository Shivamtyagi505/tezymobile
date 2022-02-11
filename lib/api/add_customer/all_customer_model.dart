// To parse this JSON data, do
//
//     final allCustomerModel = allCustomerModelFromJson(jsonString);

import 'dart:convert';

AllCustomerModel allCustomerModelFromJson(String str) => AllCustomerModel.fromJson(json.decode(str));

String allCustomerModelToJson(AllCustomerModel data) => json.encode(data.toJson());

class AllCustomerModel {
    AllCustomerModel({
        this.data,
        this.meta,
    });

    List<AllCustomerData>? data;
    Meta? meta;

    factory AllCustomerModel.fromJson(Map<String, dynamic> json) => AllCustomerModel(
        data: List<AllCustomerData>.from(json["data"].map((x) => AllCustomerData.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
    };
}

class AllCustomerData {
    AllCustomerData({
        this.id,
        this.attributes,
    });

    int? id;
    AllCustomerAttributes? attributes;

    factory AllCustomerData.fromJson(Map<String, dynamic> json) => AllCustomerData(
        id: json["id"],
        attributes: AllCustomerAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
    };
}

class AllCustomerAttributes {
    AllCustomerAttributes({
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
    ShopEmail? shopEmail;
    String? shopUniqueId;

    factory AllCustomerAttributes.fromJson(Map<String, dynamic> json) => AllCustomerAttributes(
        name: json["name"],
        mobile: json["mobile"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        shopEmail: shopEmailValues.map![json["shopEmail"]],
        shopUniqueId: json["shopUniqueId"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "shopEmail": shopEmailValues.reverse![shopEmail],
        "shopUniqueId": shopUniqueId,
    };
}

enum ShopEmail { ABCD_ADMIN_COM }

final shopEmailValues = EnumValues({
    "abcd@admin.com": ShopEmail.ABCD_ADMIN_COM
});

class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
