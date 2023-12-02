import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/robert.png"),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Tony Stark",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "GENIUS | BILLIONAIRE | PLAYBOY | PHILANTHROPIST",
                style: TextStyle(
                  fontSize: 9.0,
                  color: Colors.blueGrey.shade100,
                  fontFamily: 'Gabarito',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.blueGrey.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    "+1 999 999-9999",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blueGrey.shade900,
                      fontFamily: 'Gabarito',
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    "tony@stark-industries.com",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blueGrey.shade900,
                      fontFamily: 'Gabarito',
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
