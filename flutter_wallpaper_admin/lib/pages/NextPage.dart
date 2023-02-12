import 'dart:io';

import 'package:admin/pages/endpoints.dart';
import 'package:admin/pages/my_functions.dart';
import 'package:admin/pages/token.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:admin/pages/formdata.dart';

class NextPage extends StatelessWidget {
  List<TextEditingController> myController =
      List.generate(5, (i) => TextEditingController());

  NextPage({Key key}) : super(key: key);
  String title;

  String path;

  File imageFile;
  bool picked = false;

  _getFromGallery() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles();
    // print(result);
    // print(result.files);
    // print(result.files[0].path);
    // print(result.files[0].name);

    // get file
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null && result.files.isNotEmpty) {
      final fileBytes = result.files.first.bytes;
      final fileName = result.files.first.name;
      print(fileBytes);
      print(fileName);
      // upload file
      // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
    }

    // File file = File(result?.files.single.path ?? " ");

    path = "";
    // if (file != null) {
    //   imageFile = File(file.path);
    //   // setState(() {
    //   //   picked = true;
    //   // });
    //   // showPopUp(imageFile.path);
    //   path = file.path;
    // }
  }

  // String text = "No Value Entered";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Products'),
          backgroundColor: Color.fromARGB(255, 74, 179, 77),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 350.0,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: myController[0],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 74, 179, 77),
                        ),
                        hintText: 'Name',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: myController[1],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Price',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 74, 179, 77),
                        ),
                        hintText: 'Price',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: myController[2],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 74, 179, 77),
                        ),
                        hintText: 'Description',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: myController[3],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'category',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 74, 179, 77),
                        ),
                        hintText: 'category',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: myController[4],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'image',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 74, 179, 77),
                        ),
                        hintText: 'image',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Center(
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                          child: CircleAvatar(
                              // backgroundImage: AssetImage(
                              //     "C:\\Users\\Ramo\\Downloads\\flutter_wallpaper_admin\\flutter_wallpaper_admin\\assets\\fonts\\shawl.jpg"),
                              ),
                          onTap: () {
                            _getFromGallery();
                          },
                        ),
                        Positioned(
                          right: 10,
                          bottom: 20,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 74, 179, 77),
                  ),
                  child: Text('Add'),
                  onPressed: () async {
                    // print('Ramo');

                    final Uri url =
                        Uri.parse(baseURL + admin + get_all_products);

                    print("Printing Data" +
                        myController[0].text +
                        int.parse(myController[1].text).toString() +
                        myController[2].text +
                        myController[3].text +
                        path +
                        url.toString());
                    await another(
                        myController[0].text,
                        int.parse(myController[1].text),
                        myController[2].text,
                        myController[3].text,
                        path,
                        url);

                    // await postFunctionToken(url,body, token);
                  },
                )
              ],
            )));
  }
}
