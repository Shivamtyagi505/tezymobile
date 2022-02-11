import 'package:meta/meta.dart';
import 'dart:convert';

class OrdersModel {
  OrdersModel({
    required this.data,
    required this.meta,
  });

  final DataClass data;
  final Meta meta;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    data: DataClass.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "meta": meta.toJson(),
  };
}

class DataClass {
  DataClass({
    required this.attributes,
  });

  final Attributes attributes;

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  Attributes({
    required this.serverDate,
    required this.totalBills,
    required this.totalProducts,
  });

  final String serverDate;
  final List<TotalBill> totalBills;
  final List<TotalProduct> totalProducts;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    serverDate: json["serverDate"],
    totalBills: List<TotalBill>.from(json["totalBills"].map((x) => TotalBill.fromJson(x))),
    totalProducts: List<TotalProduct>.from(json["totalProducts"].map((x) => TotalProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "serverDate": serverDate,
    "totalBills": List<dynamic>.from(totalBills.map((x) => x.toJson())),
    "totalProducts": List<dynamic>.from(totalProducts.map((x) => x.toJson())),
  };
}

class TotalBill {
  TotalBill({
    required this.id,
    required this.customerId,
    required this.shopEmail,
    required this.shopUniqueId,
    required this.createdAt,
    required this.updatedAt,
    required this.orderDate,
    required this.dueDate,
    required this.invoiceNumber,
    required this.adavancePayment,
    required this.grandTotalPayment,
    required this.balancePayment,
    required this.automaticBillCompletion,
    required this.manualBillCompletion,
    required this.customerName,
  });

  final int? id;
  final String? customerId;
  final String? shopEmail;
  final String? shopUniqueId;
  final String? createdAt;
  final String? updatedAt;
  final String? orderDate;
  final String? dueDate;
  final String? invoiceNumber;
  final String? adavancePayment;
  final String? grandTotalPayment;
  final String? balancePayment;
  final bool? automaticBillCompletion;
  final bool? manualBillCompletion;
  final String? customerName;

  factory TotalBill.fromJson(Map<String, dynamic> json) => TotalBill(
    id: json["id"],
    customerId: json["customerId"],
    shopEmail: json["shopEmail"],
    shopUniqueId: json["shopUniqueId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    orderDate: json["orderDate"],
    dueDate: json["dueDate"],
    invoiceNumber: json["invoiceNumber"],
    adavancePayment: json["adavancePayment"],
    grandTotalPayment: json["grandTotalPayment"],
    balancePayment: json["balancePayment"],
    automaticBillCompletion: json["automaticBillCompletion"],
    manualBillCompletion: json["manualBillCompletion"],
    customerName: json["customerName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customerId": customerId,
    "shopEmail": shopEmail,
    "shopUniqueId": shopUniqueId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "orderDate": orderDate,
    "dueDate": dueDate,
    "invoiceNumber": invoiceNumber,
    "adavancePayment": adavancePayment,
    "grandTotalPayment": grandTotalPayment,
    "balancePayment": balancePayment,
    "automaticBillCompletion": automaticBillCompletion,
    "manualBillCompletion": manualBillCompletion,
    "customerName": customerName,
  };
}

class TotalProduct {
  TotalProduct({
    required this.id,
    required this.orderId,
    required this.customerId,
    required this.shopEmail,
    required this.shopUniqueId,
    required this.fullLength,
    required this.shoulder,
    required this.shoulderGap,
    required this.sleevesLength,
    required this.armholeRound,
    required this.circleDownLoose,
    required this.sleevesRound,
    required this.upperChestRound,
    required this.lowerChestRound,
    required this.waistRound,
    required this.firstDartPoint,
    required this.secondDartPoint,
    required this.bustPoint,
    required this.frontAc,
    required this.frontNeckDeep,
    required this.backNeckDeep,
    required this.waistBandLength,
    required this.neckWidth,
    required this.createdAt,
    required this.updatedAt,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.chestRound,
    required this.backNeckWidth,
    required this.orderCompletion,
    required this.cups,
    required this.piping,
    required this.zipType,
    required this.hooks,
    required this.productType,
    required this.blouseFrontImageUrl,
    required this.blouseBackImageUrl,
    required this.blouseSleevesImageUrl,
    required this.blouseHangingsImageUrl,
    required this.frontImageBlouse,
    required this.backImageBlouse,
    required this.sleevesImageBlouse,
    required this.hangingsImageBlouse,
    required this.fabricImageBlouse,
    required this.drawingPadImageBlouse,
    required this.createdBy,
    required this.updatedBy,
    required this.sleeveLength,
    required this.sleeveRound,
    required this.hip,
    required this.waistLength,
    required this.slitLength,
    required this.lowerchestRound,
    required this.bottomRound,
    required this.topFrontImageUrl,
    required this.topBackImageUrl,
    required this.topSleevesImageUrl,
    required this.topHangingsImageUrl,
    required this.lining,
    required this.frontImageTop,
    required this.backImageTop,
    required this.sleevesImageTop,
    required this.hangingsImageTop,
    required this.fabricImageTop,
    required this.drawingPadImageTop,
    required this.falls,
    required this.zigZag,
    required this.otherStyleImageUrl,
    required this.styleImageOther,
    required this.fabricImageOther,
  });

  final int? id;
  final String? orderId;
  final String? customerId;
  final String? shopEmail;
  final String? shopUniqueId;
  final String? fullLength;
  final String? shoulder;
  final String? shoulderGap;
  final String? sleevesLength;
  final String? armholeRound;
  final String? circleDownLoose;
  final String? sleevesRound;
  final String? upperChestRound;
  final String? lowerChestRound;
  final String? waistRound;
  final String? firstDartPoint;
  final String? secondDartPoint;
  final String? bustPoint;
  final String? frontAc;
  final String? frontNeckDeep;
  final String? backNeckDeep;
  final String? waistBandLength;
  final String? neckWidth;
  final String? createdAt;
  final String? updatedAt;
  final String? productName;
  final String? price;
  final int? quantity;
  final String? chestRound;
  final String? backNeckWidth;
  final bool? orderCompletion;
  final bool? cups;
  final bool? piping;
  final String? zipType;
  final String? hooks;
  final String? productType;
  final dynamic blouseFrontImageUrl;
  final dynamic blouseBackImageUrl;
  final dynamic blouseSleevesImageUrl;
  final dynamic blouseHangingsImageUrl;
  final dynamic frontImageBlouse;
  final BackImageBlouse? backImageBlouse;
  final dynamic sleevesImageBlouse;
  final dynamic hangingsImageBlouse;
  final dynamic fabricImageBlouse;
  final dynamic drawingPadImageBlouse;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? sleeveLength;
  final String? sleeveRound;
  final String? hip;
  final String? waistLength;
  final String? slitLength;
  final String? lowerchestRound;
  final String? bottomRound;
  final dynamic topFrontImageUrl;
  final dynamic topBackImageUrl;
  final dynamic topSleevesImageUrl;
  final dynamic topHangingsImageUrl;
  final bool? lining;
  final dynamic frontImageTop;
  final dynamic backImageTop;
  final dynamic sleevesImageTop;
  final BackImageBlouse? hangingsImageTop;
  final dynamic fabricImageTop;
  final dynamic drawingPadImageTop;
  final bool? falls;
  final bool? zigZag;
  final dynamic otherStyleImageUrl;
  final BackImageBlouse? styleImageOther;
  final BackImageBlouse? fabricImageOther;

  factory TotalProduct.fromJson(Map<String, dynamic> json) => TotalProduct(
    id: json["id"],
    orderId: json["orderId"],
    customerId: json["customerId"],
    shopEmail: json["shopEmail"],
    shopUniqueId: json["shopUniqueId"],
    fullLength: json["fullLength"] == null ? null : json["fullLength"],
    shoulder: json["shoulder"] == null ? null : json["shoulder"],
    shoulderGap: json["shoulderGap"] == null ? null : json["shoulderGap"],
    sleevesLength: json["sleevesLength"] == null ? null : json["sleevesLength"],
    armholeRound: json["armholeRound"] == null ? null : json["armholeRound"],
    circleDownLoose: json["circleDownLoose"] == null ? null : json["circleDownLoose"],
    sleevesRound: json["sleevesRound"] == null ? null : json["sleevesRound"],
    upperChestRound: json["upperChestRound"] == null ? null : json["upperChestRound"],
    lowerChestRound: json["lowerChestRound"] == null ? null : json["lowerChestRound"],
    waistRound: json["waistRound"] == null ? null : json["waistRound"],
    firstDartPoint: json["firstDartPoint"] == null ? null : json["firstDartPoint"],
    secondDartPoint: json["secondDartPoint"] == null ? null : json["secondDartPoint"],
    bustPoint: json["bustPoint"] == null ? null : json["bustPoint"],
    frontAc: json["frontAC"] == null ? null : json["frontAC"],
    frontNeckDeep: json["frontNeckDeep"] == null ? null : json["frontNeckDeep"],
    backNeckDeep: json["backNeckDeep"] == null ? null : json["backNeckDeep"],
    waistBandLength: json["waistBandLength"] == null ? null : json["waistBandLength"],
    neckWidth: json["neckWidth"] == null ? null : json["neckWidth"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    productName: json["productName"],
    price: json["price"],
    quantity: json["quantity"],
    chestRound: json["chestRound"] == null ? null : json["chestRound"],
    backNeckWidth: json["backNeckWidth"] == null ? null : json["backNeckWidth"],
    orderCompletion: json["orderCompletion"],
    cups: json["cups"] == null ? null : json["cups"],
    piping: json["piping"] == null ? null : json["piping"],
    zipType: json["zipType"] == null ? null : json["zipType"],
    hooks: json["hooks"] == null ? null : json["hooks"],
    productType: json["productType"],
    blouseFrontImageUrl: json["blouseFrontImageUrl"],
    blouseBackImageUrl: json["blouseBackImageUrl"],
    blouseSleevesImageUrl: json["blouseSleevesImageUrl"],
    blouseHangingsImageUrl: json["blouseHangingsImageUrl"],
    frontImageBlouse: json["frontImage_blouse"],
    backImageBlouse: json["backImage_blouse"] == null ? null : BackImageBlouse.fromJson(json["backImage_blouse"]),
    sleevesImageBlouse: json["sleevesImage_blouse"],
    hangingsImageBlouse: json["hangingsImage_blouse"],
    fabricImageBlouse: json["fabricImage_blouse"],
    drawingPadImageBlouse: json["drawingPadImage_blouse"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    sleeveLength: json["sleeveLength"] == null ? null : json["sleeveLength"],
    sleeveRound: json["sleeveRound"] == null ? null : json["sleeveRound"],
    hip: json["hip"] == null ? null : json["hip"],
    waistLength: json["waistLength"] == null ? null : json["waistLength"],
    slitLength: json["slitLength"] == null ? null : json["slitLength"],
    lowerchestRound: json["lowerchestRound"] == null ? null : json["lowerchestRound"],
    bottomRound: json["bottomRound"] == null ? null : json["bottomRound"],
    topFrontImageUrl: json["topFrontImageUrl"],
    topBackImageUrl: json["topBackImageUrl"],
    topSleevesImageUrl: json["topSleevesImageUrl"],
    topHangingsImageUrl: json["topHangingsImageUrl"],
    lining: json["lining"] == null ? null : json["lining"],
    frontImageTop: json["frontImage_top"],
    backImageTop: json["backImage_top"],
    sleevesImageTop: json["sleevesImage_top"],
    hangingsImageTop: json["hangingsImage_top"] == null ? null : BackImageBlouse.fromJson(json["hangingsImage_top"]),
    fabricImageTop: json["fabricImage_top"],
    drawingPadImageTop: json["drawingPadImage_top"],
    falls: json["falls"] == null ? null : json["falls"],
    zigZag: json["zigZag"] == null ? null : json["zigZag"],
    otherStyleImageUrl: json["otherStyleImageUrl"],
    styleImageOther: json["styleImage_other"] == null ? null : BackImageBlouse.fromJson(json["styleImage_other"]),
    fabricImageOther: json["fabricImage_other"] == null ? null : BackImageBlouse.fromJson(json["fabricImage_other"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "customerId": customerId,
    "shopEmail": shopEmail,
    "shopUniqueId": shopUniqueId,
    "fullLength": fullLength == null ? null : fullLength,
    "shoulder": shoulder == null ? null : shoulder,
    "shoulderGap": shoulderGap == null ? null : shoulderGap,
    "sleevesLength": sleevesLength == null ? null : sleevesLength,
    "armholeRound": armholeRound == null ? null : armholeRound,
    "circleDownLoose": circleDownLoose == null ? null : circleDownLoose,
    "sleevesRound": sleevesRound == null ? null : sleevesRound,
    "upperChestRound": upperChestRound == null ? null : upperChestRound,
    "lowerChestRound": lowerChestRound == null ? null : lowerChestRound,
    "waistRound": waistRound == null ? null : waistRound,
    "firstDartPoint": firstDartPoint == null ? null : firstDartPoint,
    "secondDartPoint": secondDartPoint == null ? null : secondDartPoint,
    "bustPoint": bustPoint == null ? null : bustPoint,
    "frontAC": frontAc == null ? null : frontAc,
    "frontNeckDeep": frontNeckDeep == null ? null : frontNeckDeep,
    "backNeckDeep": backNeckDeep == null ? null : backNeckDeep,
    "waistBandLength": waistBandLength == null ? null : waistBandLength,
    "neckWidth": neckWidth == null ? null : neckWidth,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "productName": productName,
    "price": price,
    "quantity": quantity,
    "chestRound": chestRound == null ? null : chestRound,
    "backNeckWidth": backNeckWidth == null ? null : backNeckWidth,
    "orderCompletion": orderCompletion,
    "cups": cups == null ? null : cups,
    "piping": piping == null ? null : piping,
    "zipType": zipType == null ? null : zipType,
    "hooks": hooks == null ? null : hooks,
    "productType": productType,
    "blouseFrontImageUrl": blouseFrontImageUrl,
    "blouseBackImageUrl": blouseBackImageUrl,
    "blouseSleevesImageUrl": blouseSleevesImageUrl,
    "blouseHangingsImageUrl": blouseHangingsImageUrl,
    "frontImage_blouse": frontImageBlouse,
    "backImage_blouse": backImageBlouse == null ? null : backImageBlouse?.toJson(),
    "sleevesImage_blouse": sleevesImageBlouse,
    "hangingsImage_blouse": hangingsImageBlouse,
    "fabricImage_blouse": fabricImageBlouse,
    "drawingPadImage_blouse": drawingPadImageBlouse,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "sleeveLength": sleeveLength == null ? null : sleeveLength,
    "sleeveRound": sleeveRound == null ? null : sleeveRound,
    "hip": hip == null ? null : hip,
    "waistLength": waistLength == null ? null : waistLength,
    "slitLength": slitLength == null ? null : slitLength,
    "lowerchestRound": lowerchestRound == null ? null : lowerchestRound,
    "bottomRound": bottomRound == null ? null : bottomRound,
    "topFrontImageUrl": topFrontImageUrl,
    "topBackImageUrl": topBackImageUrl,
    "topSleevesImageUrl": topSleevesImageUrl,
    "topHangingsImageUrl": topHangingsImageUrl,
    "lining": lining == null ? null : lining,
    "frontImage_top": frontImageTop,
    "backImage_top": backImageTop,
    "sleevesImage_top": sleevesImageTop,
    "hangingsImage_top": hangingsImageTop == null ? null : hangingsImageTop?.toJson(),
    "fabricImage_top": fabricImageTop,
    "drawingPadImage_top": drawingPadImageTop,
    "falls": falls == null ? null : falls,
    "zigZag": zigZag == null ? null : zigZag,
    "otherStyleImageUrl": otherStyleImageUrl,
    "styleImage_other": styleImageOther == null ? null : styleImageOther?.toJson(),
    "fabricImage_other": fabricImageOther == null ? null : fabricImageOther?.toJson(),
  };
}

class BackImageBlouse {
  BackImageBlouse({
    required this.id,
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final String? createdAt;
  final String? updatedAt;

  factory BackImageBlouse.fromJson(Map<String, dynamic> json) => BackImageBlouse(
    id: json["id"],
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
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "alternativeText": alternativeText,
    "caption": caption,
    "width": width,
    "height": height,
    "formats": formats?.toJson(),
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "size": size,
    "url": url,
    "previewUrl": previewUrl,
    "provider": provider,
    "provider_metadata": providerMetadata,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class Formats {
  Formats({
    required this.large,
    required this.small,
    required this.medium,
    required this.thumbnail,
  });

  final Large? large;
  final Large? small;
  final Large? medium;
  final Large? thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    large: Large.fromJson(json["large"]),
    small: Large.fromJson(json["small"]),
    medium: Large.fromJson(json["medium"]),
    thumbnail: Large.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "large": large?.toJson(),
    "small": small?.toJson(),
    "medium": medium?.toJson(),
    "thumbnail": thumbnail?.toJson(),
  };
}

class Large {
  Large({
    required this.ext,
    required this.url,
    required this.hash,
    required this.mime,
    required this.name,
    required this.path,
    required this.size,
    required this.width,
    required this.height,
  });

  final String? ext;
  final String? url;
  final String? hash;
  final String? mime;
  final String? name;
  final dynamic path;
  final double? size;
  final int? width;
  final int? height;

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

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
  );

  Map<String, dynamic> toJson() => {
  };
}
