import 'package:admin/blocs/admin_bloc.dart';
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

class ContentsPage extends StatefulWidget {
  const ContentsPage({Key key}) : super(key: key);

  @override
  _ContentsPageState createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  // var body = {
  //   "name": "shawl",
  //   "price": 1000,
  //   "description": "this shawl is used throughout pakistan in winter",
  //   "category": "common",
  //   "imgUrl": "any image here either jpeg or png"
  // };

  DataRow _getDataRow(result, index) {
    print("Size: " + allProducts.length.toString());
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
            //https://dress-up.azurewebsites.net/admin/products/id
            final Uri url =
                Uri.parse(baseURL + admin + get_all_products + "/" + result.id);
            await deleteProducts(url);
            deletePro(index);
          },
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Products'),
          backgroundColor: Color.fromARGB(255, 74, 179, 77),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: new ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                        child: new Text('All products'),
                        // color: Colors.lightGreen,
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 74, 179, 77),
                        ),
                        onPressed: () async {},
                      ),
                      ElevatedButton(
                        child: Text('Add products'),
                        // color: Colors.lightGreen,
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 74, 179, 77),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NextPage()));
                        },
                      ),
                    ],
                  ),
                ),
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

// ScrollController controller;

// bool _isLoading;

// // final scaffoldKey = GlobalKey<ScaffoldState>();

// // @override
// // void initState() {
// //   controller = new ScrollController()..addListener(_scrollListener);
// //   super.initState();
// //   _isLoading = true;
// //   _getData();
// // }

// // Future<Null> _getData()  {

// //     setState(() => _isLoading = false);
// //     openToast(context, ' ');

// // }

// // @override
// // void dispose() {
// //   controller.removeListener(_scrollListener);
// //   super.dispose();
// // }

// // void _scrollListener() {
// //   if (!_isLoading) {
// //     if (controller.position.pixels == controller.position.maxScrollExtent) {
// //       setState(() => _isLoading = true);
// //       _getData();
// //     }
// //   }
// // }

// // refreshData() {
// //   setState(() {
// //     _isLoading = true;

// //   });

// //   _getData();
// // }

// navigateToEditPage(context, snap) {
//   nextScreen(
//       context,
//       EditContent(
//         imageUrl: snap['image url'],
//         loves: snap['loves'],
//         timestamp: snap['timestamp'],
//         category: snap['category'],
//       ));
// }

// handlePreview(context, imageUrl) async {
//   await showContentPreview(context, imageUrl);
// }

// handleDelete(context, timestamp) {
//   final AdminBloc ab = Provider.of<AdminBloc>(context, listen: false);
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return SimpleDialog(
//           contentPadding: EdgeInsets.all(50),
//           elevation: 0,
//           children: <Widget>[
//             Text(
//               'Delete?',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w900),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Want to delete this item from the database?',
//               style: TextStyle(
//                   color: Colors.grey[900],
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Center(
//                 child: Row(
//               children: <Widget>[
//                 TextButton(
//                   style: buttonStyle(Colors.redAccent),
//                   child: Text(
//                     'Yes',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   onPressed: () async {
//                     if (ab.userType == 'tester') {
//                       Navigator.pop(context);
//                       openDialog(context, 'You are a Tester',
//                           'Only admin can delete contents');
//                     } else {
//                       ab.deleteContent(timestamp).then(
//                           (value) => ab.increaseCount('contents_count'));
//                       // refreshData();
//                       Navigator.pop(context);
//                       openDialog(context, 'Deleted Successfully', '');
//                     }
//                   },
//                 ),
//                 SizedBox(width: 10),
//                 TextButton(
//                   style: buttonStyle(Color.fromARGB(255, 21, 163, 68),),
//                   child: Text(
//                     'No',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ))
//           ],
//         );
//       });
// }

// @override
// Widget build(BuildContext context) {
//   double w = MediaQuery.of(context).size.width;
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
//             color: Colors.grey[300], blurRadius: 10, offset: Offset(3, 3))
//       ],
//     ),
//     child: Column(
//       children: [
//         Expanded(
//           child: RefreshIndicator(
//             child: ListView.builder(
//               padding: EdgeInsets.only(top: 30, bottom: 20),
//               controller: controller,
//               itemCount: 2,
//               itemBuilder: (_, int index) {

//                 return Center(
//                   child: new Opacity(
//                     opacity: _isLoading ? 1.0 : 0.0,
//                     child: new SizedBox(
//                         width: 32.0,
//                         height: 32.0,
//                         child: new CircularProgressIndicator()),
//                   ),
//                 );
//               },
//             ),
//             // onRefresh: () async {
//             //   await refreshData();
//             // },
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildContentList(d) {
//   return Container(
//     margin: EdgeInsets.only(top: 10, bottom: 10),
//     padding: EdgeInsets.all(15),
//     height: 150,
//     decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[200]),
//         borderRadius: BorderRadius.circular(10)),
//     child: Row(
//       children: <Widget>[
//         Container(
//           height: 130,
//           width: 130,
//           decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(10),
//               image: DecorationImage(
//                   fit: BoxFit.cover, image: NetworkImage(d['image url']))),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 15,
//             left: 15,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 d['category'],
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: <Widget>[
//                   Container(
//                     height: 35,
//                     width: 45,
//                     decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Icon(
//                           Icons.favorite,
//                           size: 16,
//                           color: Colors.grey,
//                         ),
//                         Text(
//                           d['loves'].toString(),
//                           style: TextStyle(color: Colors.grey, fontSize: 13),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   InkWell(
//                       child: Container(
//                           height: 35,
//                           width: 45,
//                           decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Icon(Icons.remove_red_eye,
//                               size: 16, color: Colors.grey[800])),
//                       onTap: () {
//                         handlePreview(context, d['image url']);
//                       }),
//                   SizedBox(width: 10),
//                   InkWell(
//                     child: Container(
//                         height: 35,
//                         width: 45,
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Icon(Icons.edit,
//                             size: 16, color: Colors.grey[800])),
//                     onTap: () => navigateToEditPage(context, d),
//                   ),
//                   SizedBox(width: 10),
//                   InkWell(
//                     child: Container(
//                         height: 35,
//                         width: 45,
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Icon(Icons.delete,
//                             size: 16, color: Colors.grey[800])),
//                     onTap: () {
//                       handleDelete(context, d['timestamp']);
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
