// To parse this JSON data, do
//
//     final billCustomerModel = billCustomerModelFromJson(jsonString);

import 'dart:convert';

BillCustomerModel billCustomerModelFromJson(String str) => BillCustomerModel.fromJson(json.decode(str));

String billCustomerModelToJson(BillCustomerModel data) => json.encode(data.toJson());

class BillCustomerModel {
  BillCustomerModel({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory BillCustomerModel.fromJson(Map<String, dynamic> json) => BillCustomerModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.attributes,
  });

  int? id;
  Attributes? attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
      };
}

class Attributes {
  Attributes({
    this.customerId,
    this.shopEmail,
    this.shopUniqueId,
    this.createdAt,
    this.updatedAt,
    this.orderDate,
    this.dueDate,
    this.invoiceNumber,
    this.adavancePayment,
    this.grandTotalPayment,
    this.balancePayment,
    this.automaticBillCompletion,
    this.manualBillCompletion,
    this.customerName,
  });

  String? customerId;
  String? shopEmail;
  String? shopUniqueId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? orderDate;
  String? dueDate;
  String? invoiceNumber;
  String? adavancePayment;
  String? grandTotalPayment;
  String? balancePayment;
  bool? automaticBillCompletion;
  bool? manualBillCompletion;
  String? customerName;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        customerId: json["customerId"],
        shopEmail: json["shopEmail"],
        shopUniqueId: json["shopUniqueId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "customerId": customerId,
        "shopEmail": shopEmail,
        "shopUniqueId": shopUniqueId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
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

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
