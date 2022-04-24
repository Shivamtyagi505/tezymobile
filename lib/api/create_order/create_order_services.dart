import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quikieappps1/api/create_order/create_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<void> createOrderApi(CreateOrder createOrder, Map<String, File> mapOfFilesAndKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  var headers = <String, String>{'Authorization': 'Bearer $jwt', 'Content-Type': 'multipart/form-data'};

  var body = <String, dynamic>{
    "customerId": createOrder.customerId,
    "customerName": createOrder.customerName!,
    "orderDate": createOrder.orderDate.toString(),
    "dueDate": createOrder.dueDate!.toString(),
    "adavancePayment": createOrder.adavancePayment!,
    "grandTotalPayment": createOrder.grandTotalPayment!,
    "balancePayment": createOrder.balancePayment!,
    "invoiceNumber": createOrder.invoiceNumber,
    "automaticBillCompletion": createOrder.automaticBillCompletion,
    "manualBillCompletion": createOrder.manualBillCompletion,
    "orderList": createOrder.orderList
  };

  List<String> keysForImage = <String>[];
  for (int i = 0; i < mapOfFilesAndKey.length; i++) {
    String key = mapOfFilesAndKey.keys.elementAt(i);
    keysForImage.add(key);
  }

  var request = http.MultipartRequest('POST', Uri.parse('http://172.105.253.131:1337/api/orders'));

  for (int i = 0; i < keysForImage.length; i++) {
    var multipartFile = await http.MultipartFile.fromPath(keysForImage[i], mapOfFilesAndKey[keysForImage[i]]!.path);
    request.files.add(multipartFile);
  }
  request.fields.addAll({'data': json.encode(body)});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: 'Order created successfully');
  }
}
