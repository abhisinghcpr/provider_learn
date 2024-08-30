import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/crud_provider/provider.dart';
import 'package:provider_learn/shareprefrence_with_provider/screens/read_data_sharepr.dart';
import 'package:provider_learn/shareprefrence_with_provider/shareprefemence_provider/sharepref_provider.dart';

import 'crud_provider/crud_provider.dart';
import 'crud_with_provider/add_coustumer_screen/add_customer.dart';
import 'crud_with_provider/add_coustumer_screen/view_customer.dart';
import 'crud_with_provider/provider/provider.dart';
import 'firebase_options.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Pref.pref;
//   runApp(MultiProvider(
//     providers: [
//
//       ChangeNotifierProvider<UserData>(create: (c) => UserData()),
//     ],
//     child: MyApp(),
//   )
//   );
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider<TestProvider>(create: (c) => TestProvider()),
    ],
    child: MyApp(),
  ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TestScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Consumer<CountProvider>(
//               builder: (BuildContext context, value, Widget? child) {
//                 return Text(
//                   '${value.counter}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 );
//               },
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Consumer<CountProvider>(
//                     builder: (BuildContext context, value, Widget? child) {
//                       return FloatingActionButton(
//                           onPressed: value.increaseCounter,
//                           tooltip: 'Increment',
//                           child: const Icon(Icons.add)
//                       );
//                     }
//                 ),
//                 Consumer<CountProvider>(
//                     builder: (BuildContext context, value, Widget? child) {
//                       return FloatingActionButton(
//                           onPressed: value.decreaseCounter,
//                           tooltip: 'Decrement',
//                           child: const Icon(Icons.remove)
//                       );
//                     }
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
