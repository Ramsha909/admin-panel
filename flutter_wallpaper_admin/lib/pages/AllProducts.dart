import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'endpoints.dart';
import 'products.dart';
import 'token.dart';

List<Product> allProducts = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getProducts(Uri uri) async {
  print("iniside prodycts");
  var response = await http.get(uri, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];

  data.forEach((entry) {
    String name = entry["name"];
    int price = entry["price"];
    String desc = entry["description"];
    String category = entry["category"];
    String img = entry["imgUrl"];
    String id = entry["_id"];
    // String complete = imgUri+img;

    print(name);

    allProducts.add(Product(
        name: name,
        price: price,
        description: desc,
        category: category,
        imgUrl: img,
        id: id));
    // print(name);
  });

  if (response.statusCode == 200) {
    print("success");
    return true;
  } else {
    print(response.body);
    return false;
  }
}

deletePro(index) {
  allProducts.removeAt(index);
}
