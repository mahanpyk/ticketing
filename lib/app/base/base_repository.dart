import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const String baseURL = 'http://10.0.2.2:80/ticketing/';

class BaseRepository {
  Future postRequest(
      {required String url, required Map<String, String> parameters}) async {
    final response = await http.post(
      Uri.parse(baseURL + url),
      headers: {'Accept': 'application/json'},
      body: parameters,
    );

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } else {
      printError(
          info: "Request Sent error",
          logFunction: () {
            debugPrint(
                "url: ${baseURL + url}, data:$parameters 'Post Request'");
          });
      return Exception();
    }
  }

  Future getRequest({required String url, required String queryParams}) async {
    final response = await http.get(
      Uri.parse(baseURL + url + queryParams),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      printError(
          info: "Request Sent error",
          logFunction: () {
            debugPrint(
                "url: ${baseURL + url}, queryParams:$queryParams 'Get Request'");
          });
      return Exception();
    }
  }
}
