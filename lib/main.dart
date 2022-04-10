import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMD Dining Menu',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          secondaryHeaderColor: Colors.yellow),
      home: main_page(title: 'UMD Dining Menu'),
    );
  }
}

class main_page extends StatefulWidget {
  final String title;
  main_page({Key? key, required this.title}) : super(key: key);
  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  bool isLoading = false;

  String diner_name1 = '251 Diner';
  String diner_name2 = 'The Diner';
  String diner_name3 = 'South Campus Diner';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('UMD DINING HALL MENU'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //251 Dining Hall Button

                RaisedButton(
                  child: Text(
                    "251 Diner Menu",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: _changeText,
                  color: Color.fromARGB(255, 230, 45, 31),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(30.0),
                  splashColor: Color.fromARGB(255, 199, 96, 96),
                ),

                //The Diner Dining Hall Button

                RaisedButton(
                  child: Text(
                    "The Diner Menu",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: _changeText,
                  color: Color.fromARGB(255, 0, 0, 0),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(30.0),
                  splashColor: Colors.grey,
                )

                //South Campus Dining Hall Button
                ,
                RaisedButton(
                  child: Text(
                    "The Diner Menu",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: _changeText,
                  color: Color.fromARGB(255, 255, 235, 80),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(30.0),
                  splashColor: Color.fromARGB(255, 248, 237, 136),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _changeText() {
    setState(() {
      if (diner_name1.startsWith('')) {
        diner_name1 = '';
      }
    });
  }
}
