import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quikieappps1/orders/Model/orders_model.dart';
import '../../api/apifile/api_list.dart';
import '../Model/orders_model.dart';

String? stringResponse;

Future <OrdersModel> ordersModel() async {
  http.Response response;
  response = await http.get(Uri.parse(orders), headers: <String, String>{
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsImlhdCI6MTY0MzEwMTQyMSwiZXhwIjoxNjQ1NjkzNDIxfQ.bv5lVRHhuLev7tIbBGZ9B-UyGBI_TO86vUpeczzBfA8'
  });
  // print(response.statusCode);

  if (response.statusCode == 200) {
    stringResponse = response.body;
    //print(OrdersModel.fromJson(jsonDecode(stringResponse)).data.attributes.totalBills[0].customerName);
    return OrdersModel.fromJson(jsonDecode(stringResponse!));
  } else {
    print("error ${response.statusCode}");
    throw Exception('Failed to fetch data');
  }

}
