import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

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
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UMD Dining App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: []
            // if isLoading is true show loader
            // else show Column of Texts
            
                        },
                        child: Text(
                          '250 Diner',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      )
                    
                  ),
          
        )
      );
  }
}
