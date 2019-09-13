import 'package:flutter/material.dart';

class UpcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 80),
              height: 200,
              width: 200,
              child: Image.asset('res/images/upcoming.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You have no upcoming journeys',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Retrieve a booking in case you purchased a ticket as a guest user.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ButtonTheme(
            minWidth: 200,
            height: 50,
            child: OutlineButton(
              child: Text('Retrieve a booking'),
              onPressed: () {},
              focusColor: Colors.white70,
              borderSide: BorderSide(
                color: Colors.grey,
                style: BorderStyle.solid,
                width: 0.8
              ),
            ),
          )
        ],
      ),
    );
  }
}
