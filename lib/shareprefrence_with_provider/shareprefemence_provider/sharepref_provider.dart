import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/sharep_model.dart';

class UserData extends ChangeNotifier {

  List<Welcome> userList = [];


  addNewUser(Welcome userData){
    userList.add(userData);
    notifyListeners();
    storeData();
  }
  updateUser(Welcome userData,int index){
    userList[index] = userData;
    notifyListeners();
  }
  removeUser(Welcome userData,int index){
    userList.removeAt(index);
    notifyListeners();
    storeData();
  }
  storeData() async{
    var jsonData = welcomeToJson(userList);
    var prefs = await Pref.pref;
    prefs.setString('userList', jsonData);
  }
  getData() async{
    var prefs = await Pref.pref;
    var str =  prefs.getString('userList');

    if(str != null){
      var  userData = welcomeFromJson(str);
      userList = userData;
      notifyListeners();
    }
    else{
      print("null found");
    }
  }



// Future<void> saveDataToPrefs() async {
//
//   prefs.setString('email', email);
//   prefs.setString('address', address);
//   prefs.setString('phone',phone);
// }
}

class Pref{
  static Future<SharedPreferences>  pref =  SharedPreferences.getInstance();
}
