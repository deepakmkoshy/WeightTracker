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
  String _input;
  var _weight = <String>[];

  @override
  void initState() {
    super.initState();
    _input = '';
  }

  void _updateInput(String input) {
    setState(() {
      _input = input;
    });
  }

  void _updateList() {
    setState(() {
      _weight.add(_input);
    });
  }

  Widget _viewList() {
    String tmp = '';
    if (_weight.isEmpty)
      return null;
    else {
      for (var text in _weight) {
        tmp = tmp + ' ' + text;
      }
      return Text(
        tmp,
        style: Theme.of(context).textTheme.headline5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onSubmitted: _updateInput,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.purpleAccent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _updateList,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              child: InputDecorator(
                child:
                    Text(_input, style: Theme.of(context).textTheme.headline5),
                decoration: InputDecoration(
                  labelText: 'What you just inputted',
                  labelStyle: Theme.of(context).textTheme.headline5,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: _viewList(),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber),
            ),
          )
        ],
      ),
    );
    //);
  }
}
