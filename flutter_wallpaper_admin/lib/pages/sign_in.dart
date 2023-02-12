import 'dart:developer';

import 'package:admin/blocs/admin_bloc.dart';
import 'package:admin/models/config.dart';
import 'package:admin/pages/AllCustomers.dart';
import 'package:admin/pages/AllOrders.dart';
import 'package:admin/pages/AllRiders.dart';
import 'package:admin/pages/AllTailors.dart';
import 'package:admin/pages/endpoints.dart';
import 'package:admin/pages/home.dart';
import 'package:admin/pages/my_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'AllProducts.dart';
import 'endpoints.dart';
import 'package:admin/pages/NextPage.dart';
import 'package:admin/pages/contents.dart';
import 'package:admin/pages/token.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var passwordCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String password;

  handleSignIn() async {
    print("inside sign in");
    //yaha login wala method call kren url or body pass kr k
    //internet boht slow hhy yaha s kam nh hora ap kren min meeting m hu sath
    //login wala method apne banaya tha? k mn banaun?

    Uri uri = Uri.parse(baseURL + admin + login);
    var loginBody = {"email": "admin123@gmail.com", "password": "admin"};
    postFunction(uri, loginBody);

    final Uri url = Uri.parse(baseURL + admin + get_all_products);
    await getProducts(url);

    Uri urlTailor = Uri.parse(baseURL + tailor);
    getTailors(urlTailor);

    Uri urlRider = Uri.parse(baseURL + rider);
    print("before");
    getRiders(urlRider);
    print("Ramoooooooooo");
    print(urlRider);

    Uri urlCustomer = Uri.parse(baseURL + customer);
    getCustomers(urlCustomer);
    print("url customer working");
    print(urlCustomer);

    Uri urlOrder = Uri.parse(baseURL + admin + order);
    getOrders(urlOrder);
    print("url order working");
    print(urlOrder);

//     var body = {
//     "name": "shawl",
//     "price": "1000",
//     "description": "this shawl is used throughout pakistan in winter",
//     "category": "common",
// };
//    final Uri url = Uri.parse(baseURL + admin +get_all_products);
//      await postFunctionToken(url,body, token);

    //abi kren run phr sign in py click kiyha

    final AdminBloc ab = Provider.of<AdminBloc>(context, listen: false);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (password == Config().testerPassword) {
        await ab.setSignInForTesting().then((value) {
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => HomePage()));
        });
      } else {
        await ab.setSignIn().then((value) => Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => HomePage())));
      }
    }
  }

  @override
  void dispose() {
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AdminBloc ab = Provider.of<AdminBloc>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          height: 400,
          width: 600,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 10,
                offset: Offset(3, 3),
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                Config().appName,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              Text(
                'Welcome to Admin Panel',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      contentPadding: EdgeInsets.only(right: 0, left: 10),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[300],
                          child: IconButton(
                              icon: Icon(Icons.close, size: 15),
                              onPressed: () {
                                // passwordCtrl.clear();//remoe this line
                              }),
                        ),
                      ),
                    ),
                    validator: (String value) {
                      //selection ko comment krn
                      // String _adminPassword = ab.adminPass;
                      // if (value.length == 0)
                      //   return "Password can't be empty";
                      // else if (value != _adminPassword &&
                      //     value != Config().testerPassword)
                      //   return 'Wrong Password! Please try again.';

                      return null;
                    },
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordCtrl,
                    //run kren abi
                    //obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      contentPadding: EdgeInsets.only(right: 0, left: 10),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey[300],
                          child: IconButton(
                              icon: Icon(Icons.close, size: 15),
                              onPressed: () {
                                passwordCtrl.clear();
                              }),
                        ),
                      ),
                    ),
                    validator: (String value) {
                      String _adminPassword = ab.adminPass;
                      if (value.length == 0)
                        return "Password can't be empty";
                      else if (value != _adminPassword &&
                          value != Config().testerPassword)
                        return 'Wrong Password! Please try again.';

                      return null;
                    },
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 45,
                width: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 21, 163, 68),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  icon: Icon(
                    LineIcons.arrow_right,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () => handleSignIn(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
