import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _input;
  List<int> _weight;

  @override

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         TextField(
            style: Theme.of(context).textTheme.headline5,
            decoration: InputDecoration(
              labelText: "Enter your current weight",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
            ),

            ),



      ],
      ),
    );





    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "How does this box look",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      //),
    );
  }
}
