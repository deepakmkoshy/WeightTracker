import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline6,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          AssetImage('assets/images/about_photo.jpg')),
                ),
              ),
              Text(
                "This app was developed by Deepak Mathews Koshy\n\n\n\n",
                textAlign: TextAlign.center,
              ),
              Text("Weight Tracker V0.2.0"),
            ],
          ),
        ),
      ),
    );
  }
}
