import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.purple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Hive.openBox('Weight_List'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return Scaffold(
                  appBar: AppBar(
                    title: Center(
                      child: Text(
                        'Weight Tracker',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ),
                  body: MyHomePage());
          }
          return Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(
                    'Weight Tracker',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              body: Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                    Text("Loading..."),
                    CircularProgressIndicator()
                  ]))); //To load while the Hive is being loaded
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('Weight_List').compact();
    Hive.close();
    super.dispose();
  }
}
