import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../datamodel/datamodel.dart';

class UserDataProvider extends ChangeNotifier {
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('data');

  Future<void> addUser(DataModel user) async {
    try {
      await _usersCollection.add(user.toJson());
      notifyListeners();
      Fluttertoast.showToast(
          msg: ' Addd Data Successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);

    } catch (e) {
      print('Error adding user: $e');
    }
  }


  Future<List<DataModel>> fetchUsers() async {
    List<DataModel> users = [];
    try {
      QuerySnapshot snapshot = await _usersCollection.get();
      snapshot.docs.forEach((doc) {
        users.add(DataModel(
          name: doc['name'],
          address: doc['address'],
          email: doc['email'],
        ));
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
    return users;
  }
}




