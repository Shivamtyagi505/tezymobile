import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:quikieappps1/api/boutique_profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quikieappps1/api/apifile/api_list.dart';

Future<ProfileImage> getProfileImage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  final response = await http.get(
    Uri.parse(getProfileImageUrl),
    headers: <String, String>{
      'Authorization': 'Bearer $jwt',
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    var items = ProfileImage.fromJson(jsonDecode(response.body));
    return items;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("error ${response.statusCode}");
    throw Exception('Failed to Fetch All Customers');
  }
}

Future<void> updateProfileImage(File profileImage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  var headers = <String, String>{'Authorization': 'Bearer $jwt', 'Content-Type': 'multipart/form-data'};

  var body = <String, dynamic>{};

  var request = http.MultipartRequest('PUT', Uri.parse(updateProfileImageUrl));

  var multipartFile = await http.MultipartFile.fromPath('files.boutiqueImage', profileImage.path);
  request.files.add(multipartFile);
  request.fields.addAll({'data': json.encode(body)});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: 'Profile Image Updated successfully');
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

Future<void> deleteProfileImage(File profileImage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  var headers = <String, String>{'Authorization': 'Bearer $jwt', 'Content-Type': 'multipart/form-data'};

  var body = <String, dynamic>{};

  var request = http.MultipartRequest('DELETE', Uri.parse(deleteProfileImageUrl));

  var multipartFile = await http.MultipartFile.fromPath('files.boutiqueImage', profileImage.path);
  request.files.add(multipartFile);
  request.fields.addAll({'data': json.encode(body)});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: 'Delete Profile Image successfully');
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

Future<void> createProfileImage(File profileImage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');

  var headers = <String, String>{'Authorization': 'Bearer $jwt', 'Content-Type': 'multipart/form-data'};

  var body = <String, dynamic>{};

  var request = http.MultipartRequest('POST', Uri.parse(createProfileImageUrl));

  var multipartFile = await http.MultipartFile.fromPath('files.boutiqueImage', profileImage.path);
  request.files.add(multipartFile);
  request.fields.addAll({'data': json.encode(body)});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: 'Profile Image Uploaded successfully');
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
