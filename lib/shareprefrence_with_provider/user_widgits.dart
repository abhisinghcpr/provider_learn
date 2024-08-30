import 'package:flutter/material.dart';

class WidgetsClass {

  Widget editfield({required String hint,required Icon icons,required TextEditingController controller,}) {
    return
       TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hint,
          prefixIcon: icons,
        ),
        validator: (value) {
          if(value!.isEmpty){
            return "This is required";
          }

        },
      );

  }
  Widget button(String text,{required void Function()? onPressed}){
    return ElevatedButton(onPressed:onPressed, child: Text(text,));
  }
  AppBar appbar({required String appbarTitle}){
    return AppBar(
      title: Text(appbarTitle),
    );
  }

}
