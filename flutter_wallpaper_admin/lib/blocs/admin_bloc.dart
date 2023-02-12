
import 'package:flutter/foundation.dart';


class AdminBloc extends ChangeNotifier {


  String _adminPass;
  String _userType = 'Admin';
  bool _isSignedIn = true;
  bool _testing = false;
  List _categories = [];
  List _categoryNames = [];

  AdminBloc() {
    checkSignIn();
    getAdminPass();
    getCategories();
  }

  String get adminPass => _adminPass;
  String get userType => _userType;
  bool get isSignedIn => _isSignedIn;
  bool get testing => _testing;
  List get categories => _categories;
  List get categoryNames => _categoryNames;

  void getAdminPass() {




  }

  Future<int> getTotalDocuments(String documentName) async {
    final String fieldName = 'count';


    return 1;
  }

  Future increaseCount(String documentName) async {





  }

  Future deleteContent(timestamp) async {

  }

  Future getCategories() async {



    _categories.clear();
    _categoryNames.clear();


    _categories.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));
    notifyListeners();
  }

  Future deleteCategory(timestamp) async {

    getCategories();
  }

  Future saveNewAdminPassword(String newPassword) async {


  }

  Future setSignIn() async {


  }

  void checkSignIn() async {


  }

  Future setSignInForTesting() async {
    _testing = true;
    _userType = 'Admin';
    notifyListeners();
  }
}
