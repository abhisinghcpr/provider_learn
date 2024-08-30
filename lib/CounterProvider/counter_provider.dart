import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  var counter = 0;

  void increaseCounter() {
    counter = counter + 1;
    notifyListeners();
  }

  void decreaseCounter() {
    if (counter >= 1) {
      counter = counter - 1;
    } else {}
    notifyListeners();
  }
}





// class UserData extends ChangeNotifier {
//   late String name;
//   late String email;
//   late String address;
//   late String phone;
//
//   void updateUserData(String newName, String newEmail, String newAddress, String newPhone) {
//     name = newName;
//     email = newEmail;
//     address = newAddress;
//     phone = newPhone;
//
//     saveDataToPrefs();
//     notifyListeners();
//   }
//
//   // Future<void> loadDataFromPrefs() async {
//   //
//   //   final prefs = await SharedPreferences.getInstance();
//   //   name = prefs.getString('name') ?? '';
//   //   email = prefs.getString('age') ?? '';
//   //   address = prefs.getString('address') ?? '';
//   //   phone = prefs.getString('phone') ?? '';
//   //   notifyListeners();
//   // }
//
//   Future<void> saveDataToPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('name', name);
//     prefs.setString('age', email);
//     prefs.setString('address', address);
//     prefs.setString('phone', phone);
//   }
// }
