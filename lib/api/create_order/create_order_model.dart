// To parse this JSON data, do
//
//     final createOrder = createOrderFromJson(jsonString);

import 'dart:convert';

CreateOrder createOrderFromJson(String str) => CreateOrder.fromJson(json.decode(str));

String createOrderToJson(CreateOrder data) => json.encode(data.toJson());

class CreateOrder {
  CreateOrder({
    this.customerId,
    this.customerName,
    this.orderDate,
    this.dueDate,
    this.adavancePayment,
    this.grandTotalPayment,
    this.balancePayment,
    this.invoiceNumber,
    this.automaticBillCompletion,
    this.manualBillCompletion,
    this.orderList,
  });

  int? customerId;
  String? customerName;
  String? orderDate;
  String? dueDate;
  String? adavancePayment;
  String? grandTotalPayment;
  String? balancePayment;
  int? invoiceNumber;
  bool? automaticBillCompletion;
  bool? manualBillCompletion;
  List<OrderList>? orderList;

  factory CreateOrder.fromJson(Map<String, dynamic> json) => CreateOrder(
        customerId: json["customerId"],
        customerName: json["customerName"],
        orderDate: json["orderDate"],
        dueDate: json["dueDate"],
        adavancePayment: json["adavancePayment"],
        grandTotalPayment: json["grandTotalPayment"],
        balancePayment: json["balancePayment"],
        invoiceNumber: json["invoiceNumber"],
        automaticBillCompletion: json["automaticBillCompletion"],
        manualBillCompletion: json["manualBillCompletion"],
        orderList: List<OrderList>.from(json["orderList"].map((x) => OrderList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "customerName": customerName,
        "orderDate": orderDate,
        "dueDate": dueDate,
        "adavancePayment": adavancePayment,
        "grandTotalPayment": grandTotalPayment,
        "balancePayment": balancePayment,
        "invoiceNumber": invoiceNumber,
        "automaticBillCompletion": automaticBillCompletion,
        "manualBillCompletion": manualBillCompletion,
        "orderList": List<dynamic>.from(orderList!.map((x) => x.toJson())),
      };
}

class OrderList {
  OrderList({
    this.productType,
    this.productName,
    this.price,
    this.quantity,
    this.fullLength,
    this.shoulder,
    this.shoulderGap,
    this.sleevesLength,
    this.armholeRound,
    this.circleDownLoose,
    this.sleevesRound,
    this.upperChestRound,
    this.chestRound,
    this.lowerChestRound,
    this.waistRound,
    this.firstDartPoint,
    this.secondDartPoint,
    this.bustPoint,
    this.frontAc,
    this.frontNeckDeep,
    this.backNeckDeep,
    this.waistBandLength,
    this.neckWidth,
    this.backNeckWidth,
    this.orderCompletion,
    this.frontImageUrl,
    this.backImageUrl,
    this.sleevesImageUrl,
    this.hangingsImageUrl,
    this.cups,
    this.piping,
    this.zipType,
    this.hooks,
    this.sleeveLength,
    this.sleeveRound,
    this.lowerchestRound,
    this.hip,
    this.waistLength,
    this.slitLength,
    this.bottomRound,
    this.lining,
    this.styleImageUrl,
    this.falls,
    this.zigZag,
  });

  String? productType;
  String? productName;
  String? price;
  int? quantity;
  String? fullLength;
  String? shoulder;
  String? shoulderGap;
  String? sleevesLength;
  String? armholeRound;
  String? circleDownLoose;
  String? sleevesRound;
  String? upperChestRound;
  String? chestRound;
  String? lowerChestRound;
  String? waistRound;
  String? firstDartPoint;
  String? secondDartPoint;
  String? bustPoint;
  String? frontAc;
  String? frontNeckDeep;
  String? backNeckDeep;
  String? waistBandLength;
  String? neckWidth;
  String? backNeckWidth;
  bool? orderCompletion;
  String? frontImageUrl;
  String? backImageUrl;
  String? sleevesImageUrl;
  String? hangingsImageUrl;
  bool? cups;
  bool? piping;
  String? zipType;
  String? hooks;
  String? sleeveLength;
  String? sleeveRound;
  String? lowerchestRound;
  String? hip;
  String? waistLength;
  String? slitLength;
  String? bottomRound;
  bool? lining;
  String? styleImageUrl;
  bool? falls;
  bool? zigZag;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        productType: json["productType"],
        productName: json["productName"],
        price: json["price"],
        quantity: json["quantity"],
        fullLength: json["fullLength"] == null ? null : json["fullLength"],
        shoulder: json["shoulder"] == null ? null : json["shoulder"],
        shoulderGap: json["shoulderGap"] == null ? null : json["shoulderGap"],
        sleevesLength: json["sleevesLength"] == null ? null : json["sleevesLength"],
        armholeRound: json["armholeRound"] == null ? null : json["armholeRound"],
        circleDownLoose: json["circleDownLoose"] == null ? null : json["circleDownLoose"],
        sleevesRound: json["sleevesRound"] == null ? null : json["sleevesRound"],
        upperChestRound: json["upperChestRound"] == null ? null : json["upperChestRound"],
        chestRound: json["chestRound"] == null ? null : json["chestRound"],
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
        backNeckWidth: json["backNeckWidth"] == null ? null : json["backNeckWidth"],
        orderCompletion: json["orderCompletion"],
        frontImageUrl: json["frontImageUrl"] == null ? null : json["frontImageUrl"],
        backImageUrl: json["backImageUrl"] == null ? null : json["backImageUrl"],
        sleevesImageUrl: json["sleevesImageUrl"] == null ? null : json["sleevesImageUrl"],
        hangingsImageUrl: json["hangingsImageUrl"] == null ? null : json["hangingsImageUrl"],
        cups: json["cups"] == null ? null : json["cups"],
        piping: json["piping"] == null ? null : json["piping"],
        zipType: json["zipType"] == null ? null : json["zipType"],
        hooks: json["hooks"] == null ? null : json["hooks"],
        sleeveLength: json["sleeveLength"] == null ? null : json["sleeveLength"],
        sleeveRound: json["sleeveRound"] == null ? null : json["sleeveRound"],
        lowerchestRound: json["lowerchestRound"] == null ? null : json["lowerchestRound"],
        hip: json["hip"] == null ? null : json["hip"],
        waistLength: json["waistLength"] == null ? null : json["waistLength"],
        slitLength: json["slitLength"] == null ? null : json["slitLength"],
        bottomRound: json["bottomRound"] == null ? null : json["bottomRound"],
        lining: json["lining"] == null ? null : json["lining"],
        styleImageUrl: json["styleImageUrl"] == null ? null : json["styleImageUrl"],
        falls: json["falls"] == null ? null : json["falls"],
        zigZag: json["zigZag"] == null ? null : json["zigZag"],
      );

  Map<String, dynamic> toJson() => {
        "productType": productType,
        "productName": productName,
        "price": price,
        "quantity": quantity,
        "fullLength": fullLength == null ? null : fullLength,
        "shoulder": shoulder == null ? null : shoulder,
        "shoulderGap": shoulderGap == null ? null : shoulderGap,
        "sleevesLength": sleevesLength == null ? null : sleevesLength,
        "armholeRound": armholeRound == null ? null : armholeRound,
        "circleDownLoose": circleDownLoose == null ? null : circleDownLoose,
        "sleevesRound": sleevesRound == null ? null : sleevesRound,
        "upperChestRound": upperChestRound == null ? null : upperChestRound,
        "chestRound": chestRound == null ? null : chestRound,
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
        "backNeckWidth": backNeckWidth == null ? null : backNeckWidth,
        "orderCompletion": orderCompletion,
        "frontImageUrl": frontImageUrl == null ? null : frontImageUrl,
        "backImageUrl": backImageUrl == null ? null : backImageUrl,
        "sleevesImageUrl": sleevesImageUrl == null ? null : sleevesImageUrl,
        "hangingsImageUrl": hangingsImageUrl == null ? null : hangingsImageUrl,
        "cups": cups == null ? null : cups,
        "piping": piping == null ? null : piping,
        "zipType": zipType == null ? null : zipType,
        "hooks": hooks == null ? null : hooks,
        "sleeveLength": sleeveLength == null ? null : sleeveLength,
        "sleeveRound": sleeveRound == null ? null : sleeveRound,
        "lowerchestRound": lowerchestRound == null ? null : lowerchestRound,
        "hip": hip == null ? null : hip,
        "waistLength": waistLength == null ? null : waistLength,
        "slitLength": slitLength == null ? null : slitLength,
        "bottomRound": bottomRound == null ? null : bottomRound,
        "lining": lining == null ? null : lining,
        "styleImageUrl": styleImageUrl == null ? null : styleImageUrl,
        "falls": falls == null ? null : falls,
        "zigZag": zigZag == null ? null : zigZag,
      };
}
