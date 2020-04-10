import 'package:flutter/material.dart';

// import 'package:smart_hotel/screens/login_screen.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Hotel'), brightness: Brightness.dark,
        leading: IconButton(icon: Icon(Icons.menu, semanticLabel: 'login',),
            onPressed: () {
              print('Menu button');
            },// onPressed 
          ),
        
        actions: 
          <Widget>
          [ 
            IconButton(icon: Icon(Icons.search, semanticLabel: 'search',),
              onPressed: () {
                print('Search button');

              },// onPressed
            ),
          ],
      
      ),
      body: Row(
        children:<Widget>[


        ]
      ) ,
    );
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data'),
    );
  }
}