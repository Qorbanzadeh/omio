import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEntryDialog extends StatefulWidget {
  String title;

  AddEntryDialog({this.title});

  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  var _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  cursorColor: Colors.red,
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                      labelText: 'Enter your location',
                      hintText: 'eg: Tehran, Mashhad , ...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
                ),
              ),
              Divider(
                color: Colors.black,
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.only(right: 150.0),
                child: Text('POPULAR DESTINATION',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 16
                ),),
              ),

              Divider(
                color: Colors.black,
                height: 30,
              ),
              Row(
                 children: <Widget>[
                   Icon(Icons.map,color: Colors.red,),
                   Padding(
                     padding: const EdgeInsets.only(left: 8.0),
                     child: Text('Use location',style: TextStyle(color: Colors.red),),
                   ),
                 ],
              )
            ],
          ),
        ));
  }
}
