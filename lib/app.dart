import 'package:flutter/material.dart';
import 'package:smart_hotel/screens/home_screen.dart';
import 'package:smart_hotel/screens/login_screen.dart';
import 'package:smart_hotel/screens/registeration_screnn.dart';
import 'package:smart_hotel/screens/Personal_screen.dart';

 class SmartHotelApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),

      initialRoute: '/Personal_screen',
      routes: {
        '/': (context) => FormScreen(),
        '/home_screen': (context) => HomePage(),
        '/register_screen': (context) => RegisterationPage(),
        '/Personal_screen': (context) => PersonalScreen(),
      },
      // onGenerateRoute: _getRoute,


    );
  }
  // Route<dynamic> _getRoute(RouteSettings settings) {
  //   if (settings.name != '/screens/login_screen') {
  //     return null;
  //   }

  //   return MaterialPageRoute<void>(
  //     settings: settings,
  //     builder: (BuildContext context) => FormScreen(),
  //     fullscreenDialog: true,
  //   );
  // }
}


