import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/datafromfrontend/api_orders_class.dart';
import 'package:quikieappps1/orders/Model/orders_model.dart';
import 'package:quikieappps1/orders/Model/orders_put_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/apifile/api_list.dart';
import '../Model/orders_model.dart';

String? stringResponse;

Future <OrdersModel> fetchOrders() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  http.Response response;
  response = await http.get(Uri.parse(orders), headers: <String, String>{
    'Authorization':
    'Bearer $jwt'
  }).timeout(Duration(seconds: 15));

  if (response.statusCode == 200) {
    stringResponse = response.body;

    return OrdersModel.fromJson(jsonDecode(stringResponse!));
  } else {
    print("error ${response.statusCode}");
    throw Exception('Failed to fetch data');
  }
}

Future <OrdersPutModel> ordersPutRequest(ApiOrdersData data)  async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  http.Response response;
  response = await http.put(Uri.parse(ordersPut),headers:<String,String>{
    'Authorization' : 'Bearer $jwt',
    'Content-Type' : 'multipart/form-data; boundary=---011000010111000001101001'
  },
      body: jsonEncode(<String,String>{
        'manualBillCompletion': data.manualBillCompletion!,
        'balancePayment': data.balancePayment!
      })
  );

  if(response.statusCode == 200) {
    print("response.statusCode ${'successful'}");
    // stringResponse = response.body;
    return OrdersPutModel.fromJson(jsonDecode(response.body));
  }
  else {
    print("error ${response.statusCode}");
    throw Exception('Failed to load data');
  }
}
