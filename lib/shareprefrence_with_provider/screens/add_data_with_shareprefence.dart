import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/shareprefrence_with_provider/screens/read_data_sharepr.dart';
import '../model/sharep_model.dart';
import '../shareprefemence_provider/sharepref_provider.dart';
import '../user_widgits.dart';

class UserDetails extends StatefulWidget {
  UserDetails({super.key, this.userData, this.index, required this.isUpdate});

  Welcome? userData;
  int? index;
  bool isUpdate;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var view = WidgetsClass();

  @override
  void initState() {
    if (widget.isUpdate) {
      nameController.text = widget.userData!.name ?? '';
      addressController.text = widget.userData!.address ?? '';
      ageController.text = widget.userData!.email ?? '';
      phoneController.text = widget.userData!.phone ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserData>(context);
    return Scaffold(
      appBar: view.appbar(
          appbarTitle: widget.isUpdate ? 'update data' : 'Fill Data'),
      body: ListView(
        children: [
          SizedBox(height: 30,),
          Form(
              key: _formKey,
              child: Column(

                children: [
                  view.editfield(
                      hint: ' Name',
                      icons: Icon(Icons.person),
                      controller: nameController),
                  SizedBox(height: 10,),
                  view.editfield(
                      hint: 'address',
                      icons: Icon(Icons.place),
                      controller: addressController),
                  SizedBox(height: 10,),
                  view.editfield(
                      hint: 'Age',
                      icons: Icon(Icons.support_agent),
                      controller: ageController),
                  SizedBox(height: 10,),
                  view.editfield(
                      hint: ' phone',
                      icons: Icon(Icons.phone),
                      controller: phoneController),
                  SizedBox(height: 10,),
                  widget.isUpdate
                      ? ElevatedButton(
                          onPressed: () {
                            provider.updateUser(
                                Welcome(
                                    name: nameController.text,
                                    email: phoneController.text,
                                    address: addressController.text,
                                    phone: phoneController.text),
                                widget.index!);
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserHomePage(),
                                ));
                          },
                          child: const Text('Update')):
                       ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            provider.addNewUser(Welcome(
                                name: nameController.text,
                                email: phoneController.text,
                                address: addressController.text,
                                phone: phoneController.text));
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserHomePage(),
                                ));
                          },
                          child: const Text('Submit'))
                ],
              ))
        ],
      ),
    );
  }
}
