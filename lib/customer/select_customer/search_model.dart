import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.data,
    required this.meta,
  });

  final List<Datum> data;
  final Meta meta;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

   int? id;
   Attributes? attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes?.toJson(),
  };
}

class Attributes {
  Attributes({
    required this.name,
    required this.mobile,
    required this.createdAt,
    required this.updatedAt,
    required this.shopEmail,
    required this.shopUniqueId,
  });

   String? name;
   String? mobile;
   String? createdAt;
   String? updatedAt;
   String? shopEmail;
   String? shopUniqueId;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    name: json["name"],
    mobile: json["mobile"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    shopEmail: json["shopEmail"],
    shopUniqueId: json["shopUniqueId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobile": mobile,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
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
