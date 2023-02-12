import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'endpoints.dart';
import 'token.dart';

Dio dioRequest = Dio();

Future<bool> another(String name, int price, String description,
    String category, String imgUrl, Uri url) async {
  File file = File(imgUrl);

  try {
    String filename = imgUrl.split('/').last;
    String filepath = file.path;
    List<int> bytes;
    FormData formData = new FormData.fromMap({
      "name": "$name",
      "price": "$price",
      "description": "$description",
      "category": "$category",
      // "imgUrl": "$imgUrl",
      "imgUrl": await MultipartFile.fromFile(filepath),
      // "imgUrl": MultipartFile.fromBytes(
      //   bytes,
      // )
    }); // FormData.fromMap

    Response response = await dioRequest.post(url.toString(),
        data: formData,
        options: Options(
          headers: {
            "accept": "/*",
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data"
          },
        ));

    print(response);
    log(response.toString());
    if (response.data != null) {
      return true;
    } // Options
  } catch (e) {
    print(e);
    log(e.toString());
  } catch (e) {
    log(e);
    log(e.toString());
  }
  return false;
}
