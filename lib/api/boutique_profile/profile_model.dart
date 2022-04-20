// To parse this JSON data, do
//
//     final profileImage = profileImageFromJson(jsonString);

import 'dart:convert';

ProfileImage profileImageFromJson(String str) => ProfileImage.fromJson(json.decode(str));

String profileImageToJson(ProfileImage data) => json.encode(data.toJson());

class ProfileImage {
  ProfileImage({
    this.data,
    this.meta,
  });

  ProfileImageData? data;
  Meta? meta;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        data: ProfileImageData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "meta": meta!.toJson(),
      };
}

class ProfileImageData {
  ProfileImageData({
    this.id,
    this.attributes,
  });

  int? id;
  PurpleAttributes? attributes;

  factory ProfileImageData.fromJson(Map<String, dynamic> json) => ProfileImageData(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class PurpleAttributes {
  PurpleAttributes({
    this.shopEmail,
    this.shopUniqueId,
    this.createdAt,
    this.updatedAt,
    this.boutiqueImage,
  });

  String? shopEmail;
  String? shopUniqueId;
  DateTime? createdAt;
  DateTime? updatedAt;
  BoutiqueImage? boutiqueImage;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        shopEmail: json["shopEmail"],
        shopUniqueId: json["shopUniqueId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        boutiqueImage: BoutiqueImage.fromJson(json["boutiqueImage"]),
      );

  Map<String, dynamic> toJson() => {
        "shopEmail": shopEmail,
        "shopUniqueId": shopUniqueId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "boutiqueImage": boutiqueImage!.toJson(),
      };
}

class BoutiqueImage {
  BoutiqueImage({
    this.data,
  });

  BoutiqueImageData? data;

  factory BoutiqueImage.fromJson(Map<String, dynamic> json) => BoutiqueImage(
        data: BoutiqueImageData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class BoutiqueImageData {
  BoutiqueImageData({
    this.id,
    this.attributes,
  });

  int? id;
  FluffyAttributes? attributes;

  factory BoutiqueImageData.fromJson(Map<String, dynamic> json) => BoutiqueImageData(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class FluffyAttributes {
  FluffyAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  String? name;
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  dynamic providerMetadata;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats!.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class Formats {
  Formats({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  Large? large;
  Large? small;
  Large? medium;
  Large? thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        large: Large.fromJson(json["large"]),
        small: Large.fromJson(json["small"]),
        medium: Large.fromJson(json["medium"]),
        thumbnail: Large.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "large": large!.toJson(),
        "small": small!.toJson(),
        "medium": medium!.toJson(),
        "thumbnail": thumbnail!.toJson(),
      };
}

class Large {
  Large({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
  });

  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
