import 'dart:convert';

import 'package:quikieappps1/api/allcustomerpage/Model/bill_customer_model.dart';
import 'package:quikieappps1/api/allcustomerpage/Model/customers_model.dart';
import 'package:quikieappps1/api/apifile/api_list.dart';
import 'package:quikieappps1/orders/Controller/orders_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String? response;

Future<AllCustomers> allCustomerModel() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  http.Response response;
  // ignore: unused_local_variable
  Map<String, String> paramsQuery;

  response = await http.get(
    Uri.parse(addCustomer).replace(queryParameters: paramsQuery = {'start': '0', 'limit': '300'}),
    headers: <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'},
  );

  if (response.statusCode == 200) {
    stringResponse = response.body;

    return AllCustomers.fromJson(jsonDecode(stringResponse!));
  } else {
    print(response.statusCode);
    throw Exception('Failed to fetch all customer data');
  }
}

Future<BillCustomerModel> getCustomerBills(var customerId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  http.Response response;
  // ignore: unused_local_variable
  Map<String, String> paramsQuery;

  response = await http.get(
    Uri.parse('http://172.105.253.131:1337/api/customers/$customerId?bills=true'),
    headers: <String, String>{'Content-Type': 'application/json', 'Authorization': 'Bearer $jwt'},
  );

  if (response.statusCode == 200) {
    var dataResponse = response.body;

    return BillCustomerModel.fromJson(jsonDecode(dataResponse));
  } else {
    print(response.statusCode);
    throw Exception('Failed to fetch all customer data');
  }
}
