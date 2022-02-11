// To parse this JSON data, do
//
//     final referenceImageType = referenceImageTypeFromJson(jsonString);

import 'dart:convert';

ReferenceImageType referenceImageTypeFromJson(String str) => ReferenceImageType.fromJson(json.decode(str));

String referenceImageTypeToJson(ReferenceImageType data) => json.encode(data.toJson());

class ReferenceImageType {
    ReferenceImageType({
        this.data,
        this.meta,
    });

    List<SelectDesignClass>? data;
    Meta? meta;

    factory ReferenceImageType.fromJson(Map<String, dynamic> json) => ReferenceImageType(
        data: List<SelectDesignClass>.from(json["data"].map((x) => SelectDesignClass.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
    };
}

class SelectDesignClass {
    SelectDesignClass({
        this.id,
        this.attributes,
    });

    int? id;
    DatumAttributes? attributes;

    factory SelectDesignClass.fromJson(Map<String, dynamic> json) => SelectDesignClass(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
    };
}

class DatumAttributes {
    DatumAttributes({
        this.productName,
        this.referenceImageType,
        this.category,
        this.hashTag,
        this.subCategory,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.productUrl,
        this.image,
    });

    String? productName;
    String? referenceImageType;
    String? category;
    String? hashTag;
    String? subCategory;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? publishedAt;
    String? productUrl;
    SelectDesignImage? image;

    factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
        productName: json["productName"],
        referenceImageType: json["referenceImageType"],
        category: json["category"],
        hashTag: json["hashTag"],
        subCategory: json["subCategory"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        productUrl: json["productUrl"],
        image: SelectDesignImage.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "productName": productName,
        "referenceImageType": referenceImageType,
        "category": category,
        "hashTag": hashTag,
        "subCategory": subCategory,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "publishedAt": publishedAt!.toIso8601String(),
        "productUrl": productUrl,
        "image": image!.toJson(),
    };
}

class SelectDesignImage {
    SelectDesignImage({
        this.data,
    });

    Data? data;

    factory SelectDesignImage.fromJson(Map<String, dynamic> json) => SelectDesignImage(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.attributes,
    });

    int? id;
    DataAttributes? attributes;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
    };
}

class DataAttributes {
    DataAttributes({
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
    String? alternativeText;
    String? caption;
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

    factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
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
    Meta({
        this.pagination,
    });

    Pagination? pagination;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
    };
}

class Pagination {
    Pagination({
        this.page,
        this.pageSize,
        this.pageCount,
        this.total,
    });

    int? page;
    int? pageSize;
    int? pageCount;
    int? total;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
