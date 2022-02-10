import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/apifile/api_list.dart';
import 'package:quikieappps1/api/datafromfrontend/login_data_class.dart';
import 'package:quikieappps1/api/login/login_model.dart';


Future<LoginModel> getLogin(LoginData data) async {
  final response = await http.post(
    Uri.parse(login),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "identifier": data.identifier!,
      "password": data.password!,

    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return LoginModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("error ${response.statusCode}");
    throw Exception('Failed to Login');
  }
}