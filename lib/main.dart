import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showAlert() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Error'),
        content: Text('Correo o contraseña incorrectos'),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                        color: Colors.blue
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
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        fontFamily: 'Monserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      )
                    ),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Correo no puede estar vacio';
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        fontFamily: 'Monserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      )
                    ),
                    obscureText: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Contraseña no puede estar vacio';
                      }
                    },
                  )
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
                    print(_emailController.text);
                    print(_passwordController.text);

                    _firebaseMessaging.getToken().then((token) {
                      final url = 'http://localhost:3000/api/v2/authentications';
                      http.post(url, body: {'email': '${_emailController.text}', 'password': '${_passwordController.text}', 'device_token': '$token'}).then((response) {
                        print('Response status: ${response.statusCode}');
                        print('Response body: ${response.body}');

                        if (response.statusCode == 200) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                        } else {
                          _showAlert();
                        }

                      });
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        )
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            tooltip: 'Notificaciones'
          ),
        ],
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          tooltip: 'Mi cuenta'
        ),
        title: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu'
        )
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  ButtonTheme.bar( // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () { /* ... */ },
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  ButtonTheme.bar( // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () { /* ... */ },
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () { /* ... */ },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
