import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'S',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(70.0, 110.0, 0.0, 0.0),
                  child: Text(
                    '·',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    )
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(100.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Fleet',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    )
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    )
                  ),
                )
              ],
            )
          ),
        ],
      )
    );
  }
}
