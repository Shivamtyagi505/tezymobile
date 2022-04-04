
class OrdersPutModel {
  OrdersPutModel({
    required this.data,
    required this.meta,
  });

  Data data;
  Meta meta;

  factory OrdersPutModel.fromJson(Map<String, dynamic> json) => OrdersPutModel(
    data: Data.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "meta": meta.toJson(),
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

  String customerId;
  String shopEmail;
  String shopUniqueId;
  String createdAt;
  String updatedAt;
  String orderDate;
  String dueDate;
  String invoiceNumber;
  String adavancePayment;
  String grandTotalPayment;
  String balancePayment;
  bool automaticBillCompletion;
  bool manualBillCompletion;
  String customerName;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
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

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
  );

  Map<String, dynamic> toJson() => {
  };
}
