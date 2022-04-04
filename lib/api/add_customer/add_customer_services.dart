import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/add_customer/add_customer_model.dart';
import 'package:quikieappps1/api/add_customer/all_customer_model.dart';
import 'package:quikieappps1/api/apifile/api_list.dart';
import 'package:quikieappps1/api/datafromfrontend/add_customer_class.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<AddCustomerModel> addCustomerApi(AddCustomerData data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  final response = await http.post(
    Uri.parse(addCustomer),
    headers: <String, String>{
     'Authorization': 'Bearer $jwt',
     'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "name": data.name!,
      "mobile": data.mobile!,

    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
     var items = AddCustomerModel.fromJson(jsonDecode(response.body));
  //   final items= (json.decode(response.body) as List).map((e) => AddCustomerModel.fromJson(e)).toList();
   return items;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("error ${response.statusCode}");
    throw Exception('Failed to Fetch All Customers');
  }
}

Future<AllCustomerModel> getCustomerApi() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  final response = await http.get(
    Uri.parse(addCustomer),
    headers: <String, String>{
     'Authorization': 'Bearer $jwt',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
     var items = AllCustomerModel.fromJson(jsonDecode(response.body));
  //   final items= (json.decode(response.body) as List).map((e) => AddCustomerModel.fromJson(e)).toList();
   return items;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("error ${response.statusCode}");
    throw Exception('Failed to AddCustomer');
  }
}