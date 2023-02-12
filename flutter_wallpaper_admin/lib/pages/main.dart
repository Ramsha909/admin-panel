import 'dart:convert';

// import 'package:dart_application_1/Tailor.dart';
// import 'package:dart_application_1/jazzcash.dart';
// import 'package:dart_application_1/my_functions.dart';
// import 'package:dart_application_1/products.dart';
// import 'package:dart_application_1/endpoints.dart';
import 'package:admin/pages/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'my_functions.dart';
import 'token.dart';
// import 'package:dart_application_1/my_functions.dart';

// import 'token.dart';
// import 'Network.dart';
// import 'admin.dart';
// import 'api_services.dart';
// import 'image.dart';

Future<void> main() async {
  final Uri url = Uri.parse(baseURL + admin + login);
  var body = {"email": "admin@gmail.com", "password": "admin123"};

  postFunction(url, body);

  postFunctionToken(url, body, token);

  getFunctionToken(url, token);

}
// // var serviceBody = {
// //   "name": "sooraj",
// //   "description": "men clothes tailor ",
// //   "price": 200,
// //   "imgUrl": "/Users/soorajkumar/Desktop/profile.jpeg"
// // };

// var profileBody = {
//   "userName": "sooraj",
//   "gender": "male",
//   "location": "english",
//   "imgUrl": "/Users/soorajkumar/Desktop/profile.jpeg",
// };

// print("Calling Tailor Service API:");
// print(tailorLoginURL.toString());

// var response = await http.get(
//   tailorLoginURL,
//   headers: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   },
// );

// print(token);
// another();
// patchImage();
// print(uploadData());
// payment();

adminLogin() async {}

// Future<void> main() async {
//   String username = "siba";
//   String password = "siba";
//   String email = "siba@gmail.com";
//   String contact = "89898898";

//   var loginBody = {"email": email, "password": password};
//   var signUpBody = {
//     "name": username,
//     "email": email,
//     "password": password,
//     "contactNumber": contact
//   };

//   final Uri cusSignUpURL = Uri.parse(baseURL + customer + signup);
//   final Uri cusLoginURL = Uri.parse(baseURL + customer + login);
//   final Uri tailorSignUpURL = Uri.parse(baseURL + tailor + signup);
//   final Uri tailorLoginURL = Uri.parse(baseURL + tailor + login);

//   final Uri products = Uri.parse(baseURL + admin + get_all_products);

//   print("Calling All Products API:");
//   print(products.toString());

//   var response = await http.get(
//     products,
//     headers: {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     },
//   );
//   print("Receiveing response");
//   print("Response code: ${response.statusCode}");
//   // print(jsonDecode(response.body));

//   Map<String, dynamic> map = json.decode(response.body);
//   List<dynamic> data = map["result"];
//   List<Product> list = [];

//   data.forEach((entry) {
//     String name = entry["name"];
//     int price = entry["price"];
//     String desc = entry["description"];
//     String category = entry["category"];
//     String img = entry["imgUrl"];
//     list.add(Product(
//         name: name,
//         price: price,
//         description: desc,
//         category: category,
//         imgUrl: img));
//     print(
//         "name: $name, price: $price, desc: $desc, category: $category, Image URL: $img");
//   });

//   print(list.length);

//   // print("Calling Customer Sign Up API:");
//   // print(cusSignUpURL.toString());

//   // var response = await http.post(cusSignUpURL,
//   //     headers: {
//   //       HttpHeaders.contentTypeHeader: 'application/json',
//   //     },
//   //     body: jsonEncode(signUpBody));
//   // print("Receiveing response");
//   // print("Response code: ${response.statusCode}");
//   // print("Response Body:\n${response.body}");

//   // print("\n\nCalling Customer Login API:");
//   // print(cusLoginURL.toString());

//   // var response1 = await http.post(cusLoginURL,
//   //     headers: {
//   //       HttpHeaders.contentTypeHeader: 'application/json',
//   //     },
//   //     body: jsonEncode(loginBody));
//   // print("Receiveing response");
//   // print("Response code: ${response1.statusCode}");
//   // print("Response Body:\n" + jsonDecode(response1.body)["token"]);

//   // print("\n\nCalling Tailor SignUp API:");
//   // print(tailorSignUpURL.toString());

//   // var response2 = await http.post(tailorSignUpURL,
//   //     headers: {
//   //       HttpHeaders.contentTypeHeader: 'application/json',
//   //     },
//   //     body: jsonEncode(signUpBody));
//   // print("Receiveing response");
//   // print("Response code: ${response2.statusCode}");
//   // print("Response Body:\n${response2.body}");

//   // print("\n\nCalling Tailor Login API:");
//   // print(tailorLoginURL.toString());

//   // var response3 = await http.post(tailorLoginURL,
//   //     headers: {
//   //       HttpHeaders.contentTypeHeader: 'application/json',
//   //     },
//   //     body: jsonEncode(loginBody));
//   // print("Receiveing response");
//   // print("Response code: ${response3.statusCode}");
//   // print("Response Body:\n" + jsonDecode(response3.body)["token"]);
// }
