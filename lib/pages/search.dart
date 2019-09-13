import 'dart:math';
import 'dart:ui' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:omio_clone/pages/location.dart';
import 'package:persian_datepicker/persian_datepicker.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  AnimationController _angleController;
  var _angle = 0.0;

  final TextEditingController _persianDateController = TextEditingController();
  PersianDatePickerWidget _persianDatePicker;

  var _selectedItem;
  var _numberOfPassenger;
  var _adults;
  var _children;
  var _infants;

  PersistentBottomSheetController _personClickBottomController;

  var _heightOfModalBottomSheet = 500.0;

  @override
  void initState() {
    super.initState();
    _angleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _angleController.addListener(() {
      setState(() {
        _angle = _angleController.value * 180 / 360 * pi * 2;
      });
    });

    _persianDatePicker = PersianDatePicker(
            controller: _persianDateController,
            rangeDatePicker: true,
            farsiDigits: true,
            currentDayBackgroundColor: Colors.green,
            headerTodayBackgroundColor: Colors.green,
            selectedDayBackgroundColor: Colors.blueGrey)
        .init();

    _selectedItem = 'Round Trip';
    _numberOfPassenger = 1;
    _adults = 1;
    _children = 0;
    _infants = 0;
  }

  @override
  void dispose() {
    _angleController.dispose();
    _persianDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 190.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'res/images/search.jpg',
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    "What's your destination?",
                    style: TextStyle(fontFamily: 'GenghisKhan', fontSize: 22),
                  ),
                  titlePadding: EdgeInsets.fromLTRB(10, 20, 8, 4),
                ),
              ),
            ];
          },
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12), bottom: Radius.circular(1)),
            ),
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      child: Row(
                        children: <Widget>[
                          Text(
                            _selectedItem,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      onTap: _RoundTripClicked,
                    )),
                    Expanded(child: SizedBox()),
                    Expanded(
                        child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () => _personClicked(),
                          child: Icon(
                            Icons.person,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                        ),
                        Text('$_numberOfPassenger'),
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.blueGrey,
                          size: 30,
                        ),
                        Text(' 0')
                      ],
                    ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 24, 12, 20),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () => _openLocationSelector('Departure'),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black12),
                              height: 60,
                              width: 330,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.my_location,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'City, station or airport',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () => _openLocationSelector('Arrival'),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black12),
                              height: 60,
                              width: 330,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.my_location,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'City, station or airport',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: _datePicker,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black12),
                              height: 60,
                              width: 330,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Choose date',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            elevation: 12.0,
                            onPressed: () {},
                            minWidth: 330,
                            height: 60,
                            textColor: Colors.white,
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 18),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  'How it works',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                      fontSize: 18),
                                ),
                              ),
                              Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 40.0, 0.0, 0.0),
                                child: ListTile(
                                  leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black87,
                                        size: 20,
                                      )),
                                  title: Text(
                                    'Search',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Find train,bus and flight prices all across Europe',
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 250.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text("'"),
                                      Text("'"),
                                      Text("'"),
                                      Text("'"),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 0.0, 20.0, 0.0),
                                child: ListTile(
                                  leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.compare,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                  title: Text(
                                    'Compare',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Choose the fastest and cheapest routesfrom 800+ offical partners',
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 250.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text("'"),
                                      Text("'"),
                                      Text("'"),
                                      Text("'"),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 0.0, 20.0, 0.0),
                                child: ListTile(
                                  leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.card_travel,
                                        color: Colors.blue,
                                        size: 20,
                                      )),
                                  title: Text(
                                    'Book',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Book tickets and get customer support 7 days a week throughout your jorney',
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(),
                              ListTile(),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 250,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: InkWell(
                                  onTap: _animationButtonTap,
                                  child: Transform.rotate(
                                    angle: _angle,
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Icon(
                                          Icons.import_export,
                                          color: Colors.blueGrey,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  void _animationButtonTap() {
    if (_angleController.status == AnimationStatus.completed) {
      _angleController.reverse();
    } else if (_angleController.status == AnimationStatus.dismissed) {
      _angleController.forward();
    }
  }

  void _datePicker() {
    FocusScope.of(context)
        .requestFocus(new FocusNode()); // to prevent opening default keyboard
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return _persianDatePicker;
        });
  }

  void _RoundTripClicked() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(12), bottom: Radius.circular(1))),
        context: context,
        builder: (context) {
          return Container(
            height: 120,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('One Way'),
                  onTap: () => _selectItem('One Way'),
                ),
                ListTile(
                  title: Text('Round Trip'),
                  onTap: () => _selectItem('Round Trip'),
                ),
              ],
            ),
          );
        });
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }

  void _openLocationSelector(String title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return AddEntryDialog(
                title: title,
              );
            },
            fullscreenDialog: true));
  }

  void _personClicked() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(12), bottom: Radius.circular(1))),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState
                  /*You can rename this!*/) {
            return Container(
                height: _heightOfModalBottomSheet,
                decoration: BoxDecoration(),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 16, 250, 8),
                      child: Text(
                        'Passengers',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 150, 4),
                              child: Text(
                                'Adults',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.indigo),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Text(
                                'More than 14 years old',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black38),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 30, 0, 4),
                          child: IconButton(
                            onPressed: () => {
                              if (_adults != 0)
                                {
                                  setState(() {
                                    _adults--;
                                  })
                                }
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              size: 28,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: Text(
                            '$_adults',
                            style:
                                TextStyle(fontSize: 24, color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: IconButton(
                            onPressed: () => setState(() {
                              _adults++;
                            }),
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 28,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 150, 4),
                              child: Text(
                                'Children',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.indigo),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 110),
                              child: Text(
                                '4-14 years old',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black38),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: IconButton(
                            onPressed: () => {
                              if (_children != 0)
                                {
                                  setState(() {
                                    _children--;
                                  })
                                }
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              size: 28,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: Text(
                            '$_children',
                            style:
                                TextStyle(fontSize: 24, color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: IconButton(
                            onPressed: () => setState(() {
                              _children++;
                            }),
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 28,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 160, 4),
                              child: Text(
                                'Infants',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.indigo),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Text(
                                'Under 4 years old',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black38),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: IconButton(
                            onPressed: () => {
                              if (_infants != 0)
                                {
                                  setState(() {
                                    _infants--;
                                  })
                                }
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              size: 28,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: Text(
                            '$_infants',
                            style:
                                TextStyle(fontSize: 24, color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 4),
                          child: IconButton(
                            onPressed: () => setState(() {
                              _infants++;
                            }),
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 28,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {
                        int sum = _adults + _children + _infants;
                        Navigator.pop(context);
                        _setPassengers(sum);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      minWidth: 300,
                      height: 50,
                      color: Colors.redAccent,
                      child: Text('Done',style: TextStyle(color: Colors.white),),
                    )
                  ],
                ));
          });
        });
  }

  void _setPassengers(int sum) {
    setState(() {
      _numberOfPassenger = sum;
    });
  }
}
