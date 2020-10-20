import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Expense Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red[300],
      ),
      body: Column(
        children: [
          Expanded(
              child: Opacity(
            opacity: 0.3,
            child: Container(
                width: double.infinity,
                child: Card(
                  color: Colors.red,
                  child: Text('EXPENSES'),
                )),
          )),
          Expanded(
              flex: 3,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.red,
                    child: Text('LIST OF TX'),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
