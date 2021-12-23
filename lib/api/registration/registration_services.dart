import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/datafromfrontend/registration_data_class.dart';
import 'package:quikieappps1/api/registration/registration_model.dart';


Future<RegistrationModel> createUser(RegistrationData data) async {
  final response = await http.post(
    Uri.parse("http://172.105.253.131:1337/api/auth/local/register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "username": data.name,
      "email": data.email,
      "password": data.password,

    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("sucessfull ${response.statusCode}");
    return RegistrationModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("error ${response.statusCode}");
    throw Exception('Failed to creattt user.');
  }
}