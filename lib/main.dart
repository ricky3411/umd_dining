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
  bool isLoading = false;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final food_items = <String>[];
  final food_database = <String>["pizza", "hamburger", "chicken", "quesadilla"];

  String food = "";

  Future<List<String>> extractData() async {
    // getting response from the targeted url
    final response = await http.Client().get(Uri.parse(
        'https://nutrition.umd.edu/shortmenu.aspx?sName=%3cfont+style%3d%22color%3aRed%22%3eDining+%40+Maryland%3c%2ffont%3e&locationNum=04&locationName=%3cfont+style%3d%22color%3aRed%22%3eThe+Diner%3c%2ffont%3e&naFlag=1'));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);

      try {
        var food_title = document.getElementsByClassName('shortmenumeals')[0];
        print(food_title);

        return [food_title.text.trim()];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UMD Dining App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if isLoading is true show loader
            // else show Column of Texts
            isLoading
                ? CircularProgressIndicator()
                : Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          ListView.builder(
                            padding: const EdgeInsets.all(16.0),
                            itemBuilder: /*1*/ (context, i) {
                              if (i.isOdd) return const Divider(); /*2*/

                              final index = i ~/ 2; /*3*/
                              if (index >= food_items.length) {
                                food_items.addAll(food_database.take(3)); /*4*/
                              }
                              return ListTile(
                                title: Text(
                                  food_items[0],
                                  style: _biggerFont,
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          '250 Diner',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      )
                    ],
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          ],
        )),
      ),
    );
  }
}
