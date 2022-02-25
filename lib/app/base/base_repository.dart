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

/*  Future<ResponseModel> putRequest(url, {data, message, needToken = true}) async {
    add();
    String token = needToken ? await getToken() : '';
    if (token != null) {
      Map<String, String> headers = {
        'Accept': 'application/json',
      };
      if (needToken) {
        headers.putIfAbsent('Authorization', () => 'Bearer $token');
      }
      try {
        return dio
            .put(
          BASE_URL + url,
          data: data,
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: true,
            validateStatus: (_) => true,
          ),
        )
            .then((value) {
          ResponseModel res = ResponseModel(
              body: value.data,
              statusCode: value.statusCode,
              success: value.statusCode == 200,
              data: (!(value.data is List)) && value.data.containsKey('data')
                  ? value.data['data']
                  : value.data);
          return res;
        }).catchError((e, s) {
          errorHandler(e, s, BASE_URL + url, data, 'put');
          return ResponseModel(success: false);
        });
      } catch (e, s) {
        errorHandler(e, s, BASE_URL + url, data, 'put');
        return ResponseModel(
          success: false,
        );
      }
    } else {
      return ResponseModel(
        success: false,
      );
    }
  }

  Future<ResponseModel> getRequest(url,
      {queryParameters,
      message,
      needToken = true,
      useCom: false,
      checkNet: true}) async {
    String urlFinal = useCom ? COM_BASE_URL : BASE_URL;
    if (checkNet) {
      add();
    }
    String token = needToken ? await getToken() : '';
    if (token != null) {
      Map<String, String> headers = {
        'Accept': 'application/json',
      };
      if (needToken) {
        headers.putIfAbsent('Authorization', () => 'Bearer $token');
      }
      try {
        return dio
            .get(
          BASE_URL + url,
          options: Options(
            headers: headers,
            receiveDataWhenStatusError: true,
            validateStatus: (_) => true,
          ),
          queryParameters: queryParameters,
        )
            .then((value) {
          ResponseModel res = ResponseModel(
            body: value.data,
            statusCode: value.statusCode,
            success: value.statusCode == 200,
            data: (!(value.data is List) && !(value.data is bool)) &&
                    value.data.containsKey('data')
                ? value.data['data']
                : value.data,
          );
          return res;
        }).catchError((e, s) {
          errorHandler(e, s, urlFinal + url, queryParameters, 'get');
          return ResponseModel(success: false);
        });
      } catch (e, s) {
        errorHandler(e, s, urlFinal + url, queryParameters, 'get');
        return ResponseModel(
          success: false,
        );
      }
    } else {
      return ResponseModel(
        success: false,
      );
    }
  }

  Future<ResponseModel> deleteRequest(url, {id, message}) async {
    add();
    String token = await getToken();
    if (token != null) {
      try {
        return dio
            .delete(
          BASE_URL + url + id,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
            },
            receiveDataWhenStatusError: true,
            validateStatus: (_) => true,
          ),
        )
            .then((value) {
          ResponseModel res = ResponseModel(
            body: value.data,
            statusCode: value.statusCode,
            success: value.statusCode == 200,
          );
          return res;
        }).catchError((e, s) {
          errorHandler(e, s, BASE_URL + url, id, 'delete');
          return ResponseModel(success: false);
        });
      } catch (e, s) {
        errorHandler(e, s, BASE_URL + url, id, 'delete');
        return ResponseModel(
          success: false,
        );
      }
    } else {
      return ResponseModel(
        success: false,
      );
    }
  }*/
}
