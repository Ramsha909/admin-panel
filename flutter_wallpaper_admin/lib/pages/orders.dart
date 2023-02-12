import 'package:admin/blocs/admin_bloc.dart';
import 'package:admin/pages/AllOrders.dart';
import 'package:admin/pages/AllProducts.dart';
import 'package:admin/pages/NextPage.dart';
import 'package:admin/pages/edit_content.dart';
import 'package:admin/pages/products.dart';
import 'package:admin/pages/token.dart';
import 'package:admin/utils/content_preview.dart';
import 'package:admin/utils/dialog.dart';
import 'package:admin/utils/next_screen.dart';
import 'package:admin/utils/styles.dart';
import 'package:admin/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/pages/my_functions.dart';
import 'package:admin/pages/main.dart';
import 'package:admin/pages/endpoints.dart';
import 'package:admin/pages/main.dart';
import 'package:http/http.dart' as http;

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // var body = {
  //   "name": "shawl",
  //   "price": 1000,
  //   "description": "this shawl is used throughout pakistan in winter",
  //   "category": "common",
  //   "imgUrl": "any image here either jpeg or png"
  // };

  DataRow _getDataRow(result, index) {
    print("Size: " + allOrders.length.toString());
    print("inside get data" + result.name);
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(result.name)),
        DataCell(Text(result.price.toString())),
        DataCell(Text(result.description)),
        DataCell(Text(result.category)),
        DataCell(Image.network(result.imgUrl)),
        // DataCell(ElevatedButton(
        //   child: new Text('edit '),
        //   style: ElevatedButton.styleFrom(
        //     primary: Color.fromARGB(255, 74, 179, 77),
        //   ),
        //   onPressed: () {/** */},
        // )),
        DataCell(ElevatedButton(
          child: new Text('delete '),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 74, 179, 77),
          ),
          onPressed: () async {
            // //https://dress-up.azurewebsites.net/admin/products/id
            // final Uri url =
            //     Uri.parse(baseURL + admin + get_all_products + "/" + result.id);
            // await deleteProducts(url);
            // deletePro(index);
          },
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Orders'),
          backgroundColor: Color.fromARGB(255, 74, 179, 77),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.all(15),
                //   child: new ButtonBar(
                //     mainAxisSize: MainAxisSize.min,
                //     children: <Widget>[
                //       ElevatedButton(
                //         child: new Text('All Orders'),
                //         // color: Colors.lightGreen,
                //         style: ElevatedButton.styleFrom(
                //           primary: Color.fromARGB(255, 74, 179, 77),
                //         ),
                //         onPressed: () async {},
                //       ),
                //       ElevatedButton(
                //         child: Text('Add orders'),
                //         // color: Colors.lightGreen,
                //         style: ElevatedButton.styleFrom(
                //           primary: Color.fromARGB(255, 74, 179, 77),
                //         ),
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => NextPage()));
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Price',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Description',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('category',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('image',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    // DataColumn(
                    //     label: Text('edit',
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('delete',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: List.generate(allProducts.length,
                      (index) => _getDataRow(allProducts[index], index)),
                ),
              ],
            )));
  }

  Future<bool> deleteProducts(Uri uri) async {
    print("iniside dlete prodycts");
    print(uri);
    var response = await http.delete(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
    } else {
      print(response.statusCode);
    }
  }

// import 'package:admin/blocs/admin_bloc.dart';
// import 'package:admin/utils/dialog.dart';
// import 'package:admin/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AdminPage extends StatefulWidget {
//   const AdminPage({Key key}) : super(key: key);

//   @override
//   _AdminPageState createState() => _AdminPageState();
// }

// class _AdminPageState extends State<AdminPage> {
//   final formKey = GlobalKey<FormState>();
//   var passwordOldCtrl = TextEditingController();
//   var passwordNewCtrl = TextEditingController();
//   bool changeStarted = false;

//   Future handleChange() async {
//     final ab = context.read<AdminBloc>();
//     if (ab.userType == 'tester') {
//       openDialog(context, 'You are a Tester', 'Only Admin can change password');
//     } else {
//       if (formKey.currentState.validate()) {
//         formKey.currentState.save();
//         setState(() {
//           changeStarted = true;
//         });
//         await context
//             .read<AdminBloc>()
//             .saveNewAdminPassword(passwordNewCtrl.text)
//             .then((value) =>
//                 openDialog(context, 'Password has changed successfully!', ''));
//         setState(() {
//           changeStarted = false;
//         });
//         clearTextFields();
//       }
//     }
//   }

//   clearTextFields() {
//     passwordOldCtrl.clear();
//     passwordNewCtrl.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//           title: Text('Manage orders'),
//           backgroundColor: Color.fromARGB(255, 74, 179, 77),
//         ),
//         body: Padding(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(15),
//                   child: new ButtonBar(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       ElevatedButton(
//                         child: new Text(' Show all Orders'),
//                         // color: Colors.lightGreen,
//                         style: ElevatedButton.styleFrom(
//                           primary:Color.fromARGB(255, 74, 179, 77),
//                         ),
//                           onPressed: ()  {
//                               },
//                       ),
//                       ElevatedButton(
//                         child: Text('Orders in Progress'),
//                         // color: Colors.lightGreen,
//                         style: ElevatedButton.styleFrom(
//                           primary:Color.fromARGB(255, 74, 179, 77),
//                         ),
//                         onPressed: () {
//                         },

//                       ),
//                         ElevatedButton(
//                         child: Text('Completed Progress'),
//                         // color: Colors.lightGreen,
//                         style: ElevatedButton.styleFrom(
//                           primary:Color.fromARGB(255, 74, 179, 77),
//                         ),
//                         onPressed: () {
//                         },
//                         ),
//                     ],
//                   ),
//                 ),

//               ],
//             )

//         )

//     );

  //   final String adminPass = context.watch<AdminBloc>().adminPass;
  //   final double w = MediaQuery.of(context).size.width;
  //   return Container(
  //     margin: EdgeInsets.only(left: 30, right: 30, top: 30),
  //     padding: EdgeInsets.only(
  //       left: w * 0.05,
  //       right: w * 0.20,
  //     ),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(0),
  //       boxShadow: <BoxShadow>[
  //         BoxShadow(
  //           color: Colors.grey[300],
  //           blurRadius: 10,
  //           offset: Offset(3, 3),
  //         )
  //       ],
  //     ),
  //     child: Container(
  //       alignment: Alignment.centerLeft,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(
  //             height: MediaQuery.of(context).size.height * 0.05,
  //           ),
  //           Text(
  //             "Change Admin Password",
  //             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 5, bottom: 10),
  //             height: 3,
  //             width: 50,
  //             decoration: BoxDecoration(
  //                 color: Color.fromARGB(255, 21, 163, 68),
  //                 borderRadius: BorderRadius.circular(15)),
  //           ),
  //           SizedBox(
  //             height: 100,
  //           ),
  //           Form(
  //             key: formKey,
  //             child: Column(
  //               children: [
  //                 TextFormField(
  //                   controller: passwordOldCtrl,
  //                   decoration: inputDecoration(
  //                       'Enter old password', 'Old Password', passwordOldCtrl),
  //                   validator: (String value) {
  //                     if (value.isEmpty) return 'Old password is empty!';
  //                     if (value != adminPass)
  //                       return 'Old Password is wrong. Try again';
  //                     return null;
  //                   },
  //                 ),
  //                 SizedBox(
  //                   height: 30,
  //                 ),
  //                 TextFormField(
  //                   controller: passwordNewCtrl,
  //                   decoration: inputDecoration(
  //                       'Enter new password', 'New Password', passwordNewCtrl),
  //                   obscureText: true,
  //                   validator: (String value) {
  //                     if (value.isEmpty) return 'New password is empty!';
  //                     if (value == adminPass)
  //                       return 'Please use a different password';
  //                     return null;
  //                   },
  //                 ),
  //                 SizedBox(
  //                   height: 200,
  //                 ),
  //                 Container(
  //                   width: MediaQuery.of(context).size.width,
  //                   color: Color.fromARGB(255, 21, 163, 68),
  //                   height: 45,
  //                   child: changeStarted == true
  //                       ? Center(
  //                           child: Container(
  //                             height: 30,
  //                             width: 30,
  //                             child: CircularProgressIndicator(),
  //                           ),
  //                         )
  //                       : TextButton(
  //                           child: Text(
  //                             'Update Password',
  //                             style: TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                           ),
  //                           onPressed: () async {
  //                             handleChange();
  //                           }),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
}
