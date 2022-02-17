import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/place_order/invoice_number_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<InvoiceNumber> getInvoiceNumberSuggestion() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  final response = await http.get(
    Uri.parse(
        'http://172.105.253.131:1337/api/last-invoice-numbers'),
    headers: <String, String>{
      'Authorization': 'Bearer $jwt',
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // then parse the JSON.
    final items = InvoiceNumber.fromJson(jsonDecode(response.body));
    return items;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("error ${response.statusCode}");
    throw Exception('Failed to AddCustomer');
  }
}
