import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/select_design/select_design_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ReferenceImageType> selectDesignApi(var product, var front) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  final response = await http.get(
    Uri.parse(
        'http://172.105.253.131:1337/api/reference-images?populate=*&filters[productName][\$containsi]=$product&filters[referenceImageType][\$eq]=$front'),
    headers: <String, String>{
      'Authorization': 'Bearer $jwt',
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // then parse the JSON.
    final items = ReferenceImageType.fromJson(jsonDecode(response.body));
    return items;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to Retreieve Select Image');
  }
}

Future<ReferenceImageType> selectBottomOtherDesignApi(var product) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  final response = await http.get(
    Uri.parse('http://172.105.253.131:1337/api/reference-images?populate=*&filters[productName][\$containsi]=$product'),
    headers: <String, String>{
      'Authorization': 'Bearer $jwt',
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // then parse the JSON.
    final items = ReferenceImageType.fromJson(jsonDecode(response.body));
    return items;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to Retrieve Select Bottom Other design');
  }
}
