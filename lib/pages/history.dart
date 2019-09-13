import 'package:flutter/material.dart';
import 'package:omio_clone/pages/upcoming.dart';

import 'achived.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
    {
      return <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: 120.0,
          floating: true,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'res/images/history.png',
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
        body: _TabView()));
  }
}

class _TabView extends StatefulWidget {
  @override
  __TabViewState createState() => __TabViewState();
}

class __TabViewState extends State<_TabView> with TickerProviderStateMixin{

  int _currentIndex = 0;
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: AppBar(
          toolbarOpacity: 0.2,
          backgroundColor: Colors.redAccent,
          bottom: TabBar(tabs: [
            Tab(
              child: Text('Upcoming'),
            ),
            Tab(child: Text('Achived'),)
          ],
          indicatorColor: Colors.redAccent,
          indicatorWeight: 2,
          controller: _tabController,),
        ),
      ),
      body: TabBarView(children: <Widget>[
        UpcomingPage(),
        AchivedPage()
      ],
      controller: _tabController,),
    );
  }
}

