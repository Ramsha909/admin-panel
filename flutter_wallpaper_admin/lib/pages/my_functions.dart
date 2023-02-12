import 'dart:convert';
// import 'package:dart_application_1/token.dart';
// import 'package:dart_application_1/Tailor.dart';
// import 'package:dart_application_1/jazzcash.dart';
// import 'package:dart_application_1/products.dart';
import 'package:http/http.dart' as http;
import 'package:admin/pages/token.dart';
import 'dart:io';
import 'package:admin/pages/endpoints.dart';
// import '../test/Network.dart';
// import '../test/admin.dart';
// import '../test/api_services.dart';
// import '../test/image.dart';

postFunction(
  Uri url,
  var body,
) async {
  print(url.toString());

  var response = await http.post(url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(body));

  print("Receiveing response");
  print("Response code: ${response.statusCode}");
  print(jsonDecode(response.body)['token']);
  token = jsonDecode(response.body)['token'];
}

postFunctionToken(
  Uri url,
  var body,
  String token,
) async {
  print(url.toString());

  var response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body));

  print("Receiveing response");
  print("Response code: ${response.statusCode}");
  print(jsonDecode(response.body));
}

getFunctionToken(
  Uri url,
  String token, 
) async {
  print(url.toString());

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  print("Receiveing response");
  print("Response code: ${response.statusCode}");
  print(response.body);
}
