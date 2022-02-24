import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/datafromfrontend/api_orders_class.dart';
import 'package:quikieappps1/orders/Model/orders_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/apifile/api_list.dart';
import '../Model/orders_model.dart';


String? stringResponse;

Future <OrdersModel> ordersModel() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  http.Response response;
  response = await http.get(Uri.parse(orders), headers: <String, String>{
    'Authorization':
        'Bearer $jwt'
  });

  if (response.statusCode == 200) {
    stringResponse = response.body;

    return OrdersModel.fromJson(jsonDecode(stringResponse!));
  } else {
    print("error ${response.statusCode}");
    throw Exception('Failed to fetch data');
  }
}


