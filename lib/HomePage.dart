import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Weight_Tracker/Graph.dart';
import 'package:hive/hive.dart';

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
  var weight = <String>[];
  final box = Hive.box('Weight_List');
  bool _showValidationError = false;

  @override
  void initState() {
    super.initState();
    if (box.isNotEmpty) //Updating the local weight list from the database
      weight = box.get('weight');
    else
      box.put('weight', weight);
  }

  void _updateInput(String input) {
    setState(() {
      try {
        double.parse(input);
        _showValidationError = false;
        weight.add(input);
        box.put('weight', weight);
      } on Exception catch (e) {
        print('Error: $e');
        _showValidationError = true;
      }
    });
  }

  String _viewList() {
    String tmp = '';
    if (weight.isNotEmpty) {
      for (var text in weight) {
        tmp = tmp + ' ' + text;
      }
    }
    return tmp;
  }

  //Clearing the Hive weight List
  void clearDB() {
    setState(() {
      weight.clear();
      box.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    style: Theme.of(context).textTheme.headline5,
                    decoration: InputDecoration(
                      labelText: "Enter your current weight",
                      errorText: _showValidationError
                          ? 'Invalid number entered'
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onSubmitted: _updateInput,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                child: InputDecorator(
                  child: Text(_viewList(),
                      style: Theme.of(context).textTheme.headline5),
                  decoration: InputDecoration(
                    labelText: 'The weight list',
                    labelStyle: Theme.of(context).textTheme.headline5,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ),
            Graph(weight),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: RaisedButton(
                onPressed: clearDB,
                color: Colors.redAccent,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.red,
                        Colors.redAccent,
                        Colors.deepOrange,
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "CLEAR",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
