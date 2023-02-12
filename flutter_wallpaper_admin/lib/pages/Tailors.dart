import 'package:admin/blocs/admin_bloc.dart';
// import 'package:admin/pages/AllProducts.dart';
import 'package:admin/pages/NextPage.dart';
import 'package:admin/pages/edit_content.dart';
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
import 'AllTailors.dart';
import 'TailorDetails.dart';

class TailorsPage extends StatefulWidget {
  const TailorsPage({Key key}) : super(key: key);

  @override
  _TailorsPageState createState() => _TailorsPageState();
}

class _TailorsPageState extends State<TailorsPage> {
  DataRow _getDataRow(result) {
    print("Size: " + allTailors.length.toString());
    print("inside get data" + result.name);
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(result.name)),
        DataCell(Text(result.email)),
        DataCell(Text(result.number.toString())),
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
          onPressed: () {/** */},
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Tailors'),
          backgroundColor: Color.fromARGB(255, 74, 179, 77),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // Padding(
                // padding: EdgeInsets.all(15),
                // child: new ButtonBar(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     // ElevatedButton(
                //     //   child: new Text('All Tailors'),
                //     //   // color: Colors.lightGreen,
                //     //   style: ElevatedButton.styleFrom(
                //     //     primary: Color.fromARGB(255, 74, 179, 77),
                //     //   ),
                //     //   onPressed: () async {
                //     //     // final Uri url = Uri.parse(baseURL + tailor);
                //     //     // await getTailors(url);
                //     //   },
                //     // ),
                //     // ElevatedButton(
                //     //   child: Text('Add Tailors'),
                //     //   // color: Colors.lightGreen,
                //     //   style: ElevatedButton.styleFrom(
                //     //     primary: Color.fromARGB(255, 74, 179, 77),
                //     //   ),
                //     //   onPressed: () {
                //     //     // Navigator.push(
                //     //     //     context,
                //     //     //     MaterialPageRoute(
                //     //     //         builder: (context) => NextPage()));
                //     //   },
                //     // ),
                //   ],
                // ),
                //),
                DataTable(
                  columns: [
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Email',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Number',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    // DataColumn(
                    //     label: Text('category',
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.bold))),
                    // DataColumn(
                    //     label: Text('image',
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.bold))),
                    // DataColumn(
                    //     label: Text('edit',
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('delete',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: List.generate(allTailors.length,
                      (index) => _getDataRow(allTailors[index])),
                ),
              ],
            )));
  }
}


// import 'package:admin/blocs/admin_bloc.dart';
// import 'package:admin/pages/endpoints.dart';
// import 'package:admin/pages/my_functions.dart';
// import 'package:admin/pages/token.dart';
// import 'package:admin/utils/content_preview.dart';
// import 'package:admin/utils/dialog.dart';
// import 'package:admin/utils/styles.dart';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class Tailor extends StatefulWidget {
//   Tailor({Key key}) : super(key: key);

//   @override
//   _TailorState createState() => _TailorState();
// }

// class _TailorState extends State<Tailor> {
// List<Map> _books = [
//     {
//       'id': 100,
//       'title': 'Flutter Basics',
//       'author': 'David John'
//     },
//     {
//       'id': 102,
//       'title': 'Git and GitHub',
//       'author': 'Merlin Nick'
//     },
//     {
//       'id': 101,
//       'title': 'Flutter Basics',
//       'author': 'David John'
//     },
//   ];
//   var _isEditMode = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Manage tailors'),
//           backgroundColor: Color.fromARGB(255, 74, 179, 77),
//         ),
//         body: ListView(
//           children: [
//             _createDataTable(),
//             _createCheckboxField()
//           ],
//         ),
//       ),
//     );
//   }
// DataTable _createDataTable() {
//     return DataTable(columns: _createColumns(), rows: _createRows());
//   }
// List<DataColumn> _createColumns() {
//     return [
//       DataColumn(label: Text('ID')),
//       DataColumn(label: Text('Book')),
//       DataColumn(label: Text('Author'))
//     ];
//   }
// List<DataRow> _createRows() {
//     return _books
//         .map((book) => DataRow(cells: [
//               DataCell(Text('#' + book['id'].toString())),
//               _createTitleCell(book['title']),
//               DataCell(Text(book['author']))
//             ]))
//         .toList();
//   }
// DataCell _createTitleCell(bookTitle) {
//     return DataCell(_isEditMode == true ? 
//             TextFormField(initialValue: bookTitle, 
//             style: TextStyle(fontSize: 14)) 
//             : Text(bookTitle));
//   }
// Column _createCheckboxField() {
//     return Column(
//       children: [
//         Center(
//           child: 
//              ElevatedButton(
//                   child: const Text('Show all tailors'),
//                   onPressed: () {
//                     final Uri url = Uri.parse(baseURL + tailor);
//                     getFunctionToken(url, token);
//                   },
//                    style: ElevatedButton.styleFrom(elevation: 10,
//                     backgroundColor: Color.fromARGB(255, 74, 179, 77),
//                     //  padding: EdgeInsets.all(20.0),
//                     // padding: EdgeInsets.only(right: 40.0),
//                 ),
//             )
//           ,
//         ),
//       ],
//     );
//   }
// //   var formKey = GlobalKey<FormState>();
// //   var imageUrlCtrl = TextEditingController();
// //   var scaffoldKey = GlobalKey<ScaffoldState>();



  
// //   String date;
// //   String timestamp;
// //   int loves;
// //   var categorySelection;
// //   bool uploadStarted = false;





// //   void handleSubmit() async {
// //     final AdminBloc ab = Provider.of<AdminBloc>(context, listen: false);
// //     if(categorySelection != null){
// //       openDialog(context, 'Select Category First', '');
// //     }else{
// //       if (formKey.currentState.validate()) {
// //       formKey.currentState.save();
// //       if (ab.userType == 'tester') {
// //         openDialog(context, 'You are a Tester', 'Only Admin can upload, delete & modify contents');
// //       } else {
// //         setState(()=> uploadStarted = true);
// //         getDate().then((_) async{
// //           await saveToDatabase()
// //           .then((value) => ab.increaseCount('contents_count'));
// //           setState(()=> uploadStarted = false);
// //           openDialog(context, 'Uploaded Successfully', '');
// //           clearTextFeilds();
          
          
// //         });
// //       }
// //     }
// //     }
// //   }







// //   Future getDate() async {
// //     DateTime now = DateTime.now();
// //     String _date = DateFormat('dd MMMM yy').format(now);
// //     String _timestamp = DateFormat('yyyyMMddHHmmss').format(now);
// //     setState(() {
// //       date = _date;
// //       timestamp = _timestamp;
// //     });
    
// //   }



// //   Future saveToDatabase() async {

// //     // await ref.set({
// //     //   'image url': imageUrlCtrl.text,
// //     //   'loves': 0,
// //     //   'category': categorySelection,
// //     //   'timestamp': timestamp,
// //     //
// //     // });
// //   }

  


// //   clearTextFeilds() {
    
// //     imageUrlCtrl.clear();
// //     FocusScope.of(context).unfocus();
// //   }




// //   handlePreview() async{
// //     if (formKey.currentState.validate()) {
// //       formKey.currentState.save();
// //       await showContentPreview(context, imageUrlCtrl.text);
// //     }
// //   }




// //   @override
// //   Widget build(BuildContext context) {
// //     double w = MediaQuery.of(context).size.width;
// //     double h = MediaQuery.of(context).size.height;
// //     return Scaffold(
      
// //       backgroundColor: Colors.grey[200],
// //       key: scaffoldKey,
// //       body: Container(
        
// //     //     margin: EdgeInsets.only(left: 30, right: 30, top: 30),
// //     //     padding: EdgeInsets.only(
// //     //       left: w * 0.05,
// //     //       right: w * 0.20,
// //     //     ),
// //     //     decoration: BoxDecoration(
// //     //       color: Colors.white,
// //     //       borderRadius: BorderRadius.circular(0),
// //     //       boxShadow: <BoxShadow>[
// //     //         BoxShadow(
// //     //             color: Colors.grey[300], blurRadius: 10, offset: Offset(3, 3))
// //     //       ],
// //     //     ),
// //     //     child: Form(
// //     //         key: formKey,
// //     //         child: ListView(
// //     //           children: <Widget>[
// //     //             SizedBox(
// //     //               height: h * 0.10,
// //     //             ),
// //     //             Text(
// //     //               'Product Details',
// //     //               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
// //     //             ),
// //     //             SizedBox(height: 40,),

// //     //             // categoryDropdown(),

                
// //     //             SizedBox(height: 20,),


// //     //             TextFormField(
// //     //               decoration: inputDecoration('Enter Image Url', 'Image', imageUrlCtrl),
// //     //               controller: imageUrlCtrl,
// //     //               validator: (value) {
// //     //                 if (value.isEmpty) return 'Value is empty';
// //     //                 return null;
// //     //               },
                  
// //     //             ),
                
                
               

// //     //             SizedBox(height: 100,),


// //     //               Row(
// //     //                   mainAxisAlignment: MainAxisAlignment.end,
// //     //                   children: <Widget>[
                        
                       
// //     //                     TextButton.icon(
                          
// //     //                       icon: Icon(Icons.remove_red_eye, size: 25, color: Color.fromARGB(255, 100, 216, 54),),
// //     //                       label: Text('Preview', style: TextStyle(
// //     //                         fontWeight: FontWeight.w400,
// //     //                         color: Colors.black
// //     //                       ),),
// //     //                       onPressed: (){
// //     //                         handlePreview();
// //     //                       }
// //     //                     )
// //     //                   ],
// //     //                 ),
// //     //             SizedBox(
// //     //               height: 10,
// //     //             ),
// //     //             Container(
// //     //                 color: Color.fromARGB(255, 21, 163, 68),
// //     //                 height: 45,
// //     //                 child: uploadStarted == true
// //     //                   ? Center(child: Container(height: 30, width: 30,child: CircularProgressIndicator()),)
// //     //                   : TextButton(
// //     //                     child: Text(
// //     //                       'add product',
// //     //                       style: TextStyle(
// //     //                           color: Colors.white,
// //     //                           fontSize: 16,
// //     //                           fontWeight: FontWeight.w600),
// //     //                     ),
// //     //                     onPressed: () async{
// //     //                       handleSubmit();
                          
// //     //                     })
                      
// //     //                   ),
// //     //             SizedBox(
// //     //               height: 200,
// //     //             ),
// //     //           ],
// //     //         )),
// //       ),
// //     );
// //   }






// //   Widget categoryDropdown() {
// //     final AdminBloc ab = Provider.of<AdminBloc>(context, listen: false);
// //     return Container(
// //         height: 50,
// //         padding: EdgeInsets.only(left: 15, right: 15),
// //         decoration: BoxDecoration(
// //             color: Colors.grey[200],
// //             border: Border.all(color: Colors.grey[300]),
// //             borderRadius: BorderRadius.circular(30)),
// //         child: DropdownButtonFormField(
// //             itemHeight: 50,
// //             style: TextStyle(
// //                 fontSize: 14,
// //                 color: Colors.grey[800],
// //                 fontFamily: 'Poppins',
// //                 fontWeight: FontWeight.w500),
// //             decoration: InputDecoration(border: InputBorder.none),
// //             onChanged: (value) {
// //               setState(() {
// //                 categorySelection = value;
// //               });
// //             },
// //             onSaved: (value) {
// //               setState(() {
// //                 categorySelection = value;
// //               });
// //             },
// //             value: categorySelection,
// //             hint: Text('Select Category'),
// //             items: ab.categoryNames.map((f) {
// //               return DropdownMenuItem(
// //                 child: Text(f),
// //                 value: f,
// //               );
// //             }).toList()));
// //   }



//  }
