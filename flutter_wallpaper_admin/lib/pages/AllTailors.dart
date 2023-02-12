import 'dart:developer';
import 'package:admin/pages/Tailors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'endpoints.dart';
// import 'products.dart';
import 'token.dart';
import 'TailorDetails.dart';
import 'Tailors.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'endpoints.dart';
import 'products.dart';
import 'token.dart';

List<Tailor> allTailors = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getTailors(Uri uri) async {
  print("iniside Tailors");

  var response = await http.get(uri, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];
  print(data);
  data.forEach((entry) {
    String name = entry["name"];
    String email = entry["email"];
    String number = entry["contactNumber"];
    allTailors.add(Tailor(
      name: name,
      email: email,
      number: number,
    ));
    // print(name);
  });

  if (response.statusCode == 200) {
    print("suppppppppccess");
    print(response);
    return true;
  } else {
    print(response.body);
    return false;
  }
}
