import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/apifile/api_list.dart';

Future updateBoutiqueDetails(UpdateBoutiqueData updateBoutiqueData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  final response = await http.post(
    Uri.parse(updateBoutique),
    headers: <String, String>{
      'Authorization': 'Bearer $jwt',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "username": updateBoutiqueData.userName!,
      "email": updateBoutiqueData.email!,
      "password": updateBoutiqueData.password!,
      "boutiqueMobileNumber": updateBoutiqueData.mobileNumber!,
      "boutiqueAddress": updateBoutiqueData.address!,
    }),
  );

  if (response.statusCode == 200) {
    final items = jsonDecode(response.body);
    return items;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("error ${response.statusCode}");
    throw Exception('Failed to AddCustomer');
  }
}

class UpdateBoutiqueData {
  String? userName;
  String? email;
  String? password;
  String? mobileNumber;
  String? address;

  UpdateBoutiqueData({this.userName, this.email, this.password, this.mobileNumber, this.address});
}
