import 'package:flutter/material.dart';

class AchivedPage extends StatelessWidget {
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
              child: Image.asset('res/images/achived.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your tickets will be archived here.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
