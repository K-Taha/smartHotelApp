import 'package:flutter/material.dart';
import 'package:smart_hotel/colors.dart';

import 'package:smart_hotel/screens/login_screen.dart';
import 'package:smart_hotel/screens/registeration_screnn.dart';

// Setting up the controller for both login and registeration screens 

class ControllerApp extends StatelessWidget {
  const ControllerApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 7.0,
            bottom: TabBar(
              tabs: [
                Tab(text: ''),
                Tab(text: '')
              ],
            ),
            title: null,
            backgroundColor: kShrineSurfaceWhite,
            brightness: Brightness.light,
          ),
          body: TabBarView(
            children: [
              FormScreen(),
              RegisterationPage(),
            ],
          ),
        ),
      ),
    );
  }
}