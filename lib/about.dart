import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HI')),
      body: Container(
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
          ],
        ),
      ),
    );
  }
}
