import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 120.0,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'res/images/profile.png',
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      "Your Bookings",
                      style: TextStyle(fontFamily: 'GenghisKhan', fontSize: 22),
                    ),
                    titlePadding: EdgeInsets.fromLTRB(20, 20, 8, 20),
                  ),
                ),
              ];
            },
            body: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.account_balance,size: 30,color: Colors.blueGrey,),
                        ),
                        Text('Currency',style: TextStyle(fontSize: 22,color: Colors.blueGrey),),
                        SizedBox(width: 150,),
                        Text('USD',style: TextStyle(color: Colors.blue),)
                      ],
                    ),
                Divider(color: Colors.grey,),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.shopping_cart,size: 30,color: Colors.blueGrey,),
                    ),
                    Text('Discount cards',style: TextStyle(fontSize: 22,color: Colors.blueGrey),),
                  ],
                ),
                Divider(color: Colors.grey,),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings,size: 30,color: Colors.blueGrey,),
                    ),
                    Text('Settings',style: TextStyle(fontSize: 22,color: Colors.blueGrey),),
                  ],
                ),
                Divider(color: Colors.grey,),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.info,size: 30,color: Colors.blueGrey,),
                    ),
                    Text('Customer Service',style: TextStyle(fontSize: 22,color: Colors.blueGrey),),
                  ],
                ),
                Divider(color: Colors.grey,),



              ],
            )));
  }
}
