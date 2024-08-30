import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/shareprefrence_with_provider/screens/read_data_sharepr.dart';

import '../../shareprefrence_with_provider/user_widgits.dart';
import '../datamodel/datamodel.dart';
import '../provider/provider.dart';

class AddDataCoutumer extends StatefulWidget {
  AddDataCoutumer({
    super.key,
  });

  DataModel? userData;

  @override
  State<AddDataCoutumer> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<AddDataCoutumer> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addCustomer() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      User? user = _auth.currentUser;
      var data = DataModel(
        name: nameController.text,
        address: addressController.text,
        email: emailController.text,
      );
      await _firestore.collection('use_data').doc(user?.uid).set(data.toJson());
      Fluttertoast.showToast(
        msg: ' Addd Data Successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => MyHomePage()),
      // );
    } catch (e) {
      print('Error during add data: $e');
      Fluttertoast.showToast(
        msg: 'Field data add: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  var view = WidgetsClass();

  @override
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<UserDataProvider>(context);
    return Scaffold(
      appBar: view.appbar(appbarTitle: 'Add Data'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    view.editfield(
                        hint: ' Name',
                        icons: Icon(Icons.person),
                        controller: nameController),
                    SizedBox(
                      height: 10,
                    ),
                    view.editfield(
                        hint: 'address',
                        icons: Icon(Icons.place),
                        controller: addressController),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    view.editfield(
                        hint: ' Email',
                        icons: Icon(Icons.email),
                        controller: emailController),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addCustomer();
                          // Navigator.pop(context);

                          // provider.addUser(
                          //   DataModel(
                          //     name: nameController.text,
                          //     address: addressController.text,
                          //     email: emailController.text,
                          //   ),
                          // );

                          // );
                          // // Navigator.pop(
                          // //     context,
                          // //     MaterialPageRoute(
                          // //       builder: (context) => UserHomePage(),
                          // //     ));
                        },
                        child: const Text('Add Data'))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
