import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red[300],
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.yellow[200],
      ),
      body: Column(
        children: [
          Expanded(
              //flex: 4,
              child: Opacity(
            opacity: 0.6,
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
                  height: 500.0,
                  width: double.infinity,
                  child: Card(
                    color: Colors.yellow[400],
                    child: Text('bottom box'),
                  ),
                ),
              ),
              Container(
                  child: Column(children: [
                Column(children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      elevation: 20,
                      color: Colors.redAccent[300],
                      child: Text(
                        'LIST OF TX',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.redAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
                Column(
                  children: transaction
                      .map((tx) => (Card(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.yellow[100],
                                        border: Border.all()),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '₹${tx.amount}',
                                      style: TextStyle(
                                        color: Colors.red[300],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          tx.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.red[400],
                                          ),
                                        ),
                                        Text(
                                          DateFormat.yMMMMd().format(tx.date),
                                          style: TextStyle(
                                            color: Colors.red[200],
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          )))
                      .toList(),
                )
              ]))
            ],
          ),
        ],
      ),
    );
  }
}
