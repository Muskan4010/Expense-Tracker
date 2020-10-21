import 'dart:ui';

import 'package:flutter/material.dart';
import './transaction.dart';

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
  List<Transaction> transaction = [
    Transaction(
        id: 't1', title: 'Water Bottle', amount: 250.50, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Mobile Phone', amount: 10350.50, date: DateTime.now())
  ];
  void check() {
    print(DateTime.now());
  }

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
              flex: 3,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                    width: double.infinity,
                    child: Card(
                      color: Colors.red,
                      child: Text('EXPENSES'),
                    )),
              )),
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  height: 400.0,
                  width: double.infinity,
                  child: Card(
                    color: Colors.red,
                    child: Text('LIST OF TX'),
                  ),
                ),
              ),
              Column(children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  child: Card(
                    elevation: 20,
                    color: Colors.redAccent[300],
                    child: Text(
                      'LIST OF TX',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ]),
              Column(
                children: transaction
                    .map((tx) => (Card(
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.purple, border: Border.all()),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                tx.amount.toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tx.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                      color: Colors.red[400],
                                    ),
                                  ),
                                  Text(
                                    tx.date.toString(),
                                    style: TextStyle(
                                      color: Colors.red[400],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        )))
                    .toList(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
