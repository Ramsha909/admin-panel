import 'dart:developer';
import 'package:admin/pages/CustomerDatails.dart';
import 'package:admin/pages/RiderDetails.dart';
import 'package:admin/pages/Riders.dart';
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

List<Customer> allCustomers = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getCustomers(Uri uri) async {
  print("iniside Customers");

  try {
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("hello");
    print("a");
    List<dynamic> data = json.decode(response.body);
    print("b");
    // List<dynamic> data = map;
    print("data here");
    print(data);
    // print("entryyyyyyy");
    print(data);
    data.forEach((entry) {
      String name = entry["name"];
      String email = entry["email"];
      String number = entry["contactNumber"];
      // String number = entry["contactNumber"];

      // String complete = imgUri+img;

      print(name);
      print(email);
      // print(number);
      allCustomers.add(Customer(
        name: name,
        email: email,
        number: number,
      ));
      print(name);
    });
  } catch (error) {
    print("nigeeta");
    print(error);
  }
  // if (response.statusCode == 200) {
  //   print("suuuuuuuuccess");
  //   print(response);
  //   return true;
  // } else {
  //   print(response.body);
  //   return false;
  // }
}
