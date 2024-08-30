import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/CounterProvider/counter_provider.dart';
import 'decrease_provider.dart';

class IncrementDicrement extends StatelessWidget {
  const IncrementDicrement({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home:  IncrementPage(),
    );
  }
}

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key,});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('IncrementPage'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DecreaseProvider(),));
            },
            child:   Icon(Icons.arrow_forward),
          )

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have Increment the button this many times:',style: TextStyle(fontSize: 25),
            ),
            Consumer<CounterProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  '${value.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<CounterProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return FloatingActionButton(
                      onPressed: value.increaseCounter,
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    );
                  },
                ),
                // Consumer<CounterProvider>(
                //   builder: (BuildContext context, value, Widget? child) {
                //     return FloatingActionButton(
                //       onPressed: value.dicrementCounter,
                //       tooltip: 'Dicrement',
                //       child: const Icon(Icons.remove),
                //     );
                //   },
                // ), // This trailing comma makes auto
              ],
            )
          ],
        ),
      ),
    );
  }
}