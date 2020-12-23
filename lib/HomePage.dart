import 'package:Weight_Tracker/Graph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight = <String>[];
  final box = Hive.box('Weight_List');
  bool _showValidationError = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (box.isNotEmpty) //Updating the local weight list from the database
      weight = box.get('weight');
    else
      box.put('weight', weight);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateInput() {
    setState(() {
      String input = _controller.text;
      print(input);
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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  labelText: "Enter your current weight",
                  errorText: _showValidationError
                      ? 'Invalid number entered'
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                  decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 4,
                          offset: Offset(0, 4))
                    ],
                    shape: CircleBorder(),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.purple,
                        Colors.deepPurpleAccent,
                        // Colors.deepOrange,
                      ],
                    ),
                  ),
                  child:
                          IconButton(
                      onPressed: () {
                        _updateInput();
                      
                      },
                      icon: Icon(Icons.add, color: Colors.white),
                    ),
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
          child: FlatButton(
            onPressed: clearDB,
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ],
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.purple,
                    Colors.deepPurpleAccent,
                    // Colors.deepOrange,
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
