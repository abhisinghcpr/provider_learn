import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shareprefemence_provider/sharepref_provider.dart';
import '../user_widgits.dart';
import 'add_data_with_shareprefence.dart';



class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  var view = WidgetsClass();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserData>(context);
    provider.getData();
    return Scaffold(
      appBar: view.appbar(appbarTitle: 'Home Page'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetails(isUpdate: false,),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ),
        itemCount: provider.userList.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              color: Colors.white70,
              child: SizedBox(
                width: 320,
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Name",style:  TextStyle( fontSize: 18,fontWeight: FontWeight.w300),),
                        Text(provider.userList[index].name.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Email",style:  TextStyle( fontSize: 18,fontWeight: FontWeight.w300),),
                        Text(provider.userList[index].email.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Address",style:  TextStyle( fontSize: 18,fontWeight: FontWeight.w300),),
                        Text(provider.userList[index].address.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Phone",style:  TextStyle( fontSize: 18,fontWeight: FontWeight.w300),),
                        Text(provider.userList[index].phone.toString()),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetails(isUpdate: true,index: index,userData: provider.userList[index]),));
                        }, icon: const Icon(Icons.edit,color: Colors.blueGrey,)),
                        IconButton(
                            onPressed: () {
                              provider.removeUser(
                                  provider.userList[index], index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
