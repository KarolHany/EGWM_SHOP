import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  // get Api (fetch Api)
  Future<List<dynamic>> get(
      {required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem in status code ${response.statusCode}');
    }
  }

  // post Api (Store in Api)
  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem in status code ${response.statusCode}, this is a body ${jsonDecode(response.body)}');
    }
  }

  // put Api (update from Api)
 Future<dynamic> put({
  required String url,
  required dynamic body,
  String? token,
}) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  if (token != null) {
    headers['Authorization'] = 'Bearer $token';
  }

  print('url = $url body = $body token = $token'); // For debugging

  http.Response response = await http.put(
    Uri.parse(url),
    body: jsonEncode(body),
    headers: headers,
  );

  if (response.statusCode == 200) {
    print(response.body); // For debugging
    return jsonDecode(response.body);
  } else {
    throw Exception(
      'There is a problem in status code ${response.statusCode}, this is the body ${jsonDecode(response.body)}',
    );
  }
}}