import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quikieappps1/customer/select_customer/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/apifile/api_list.dart';

class FetchSearch {
  static Future<SearchModel> getUserList(String? query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString('jwt');

    var response = await http.get(
      Uri.parse(searchUrl),
      headers: <String, String>{'Authorization': 'Bearer $jwt'},
    );
    if (response.statusCode == 200) {
      var stringResponse = response.body;

      return SearchModel.fromJson(jsonDecode(stringResponse));

      // Map<String,dynamic> search = json.decode(response.body);
      // List<dynamic> data = map["data"];
      // return search.map((json) => Attributes.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}
