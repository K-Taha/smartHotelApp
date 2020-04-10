import 'package:flutter/material.dart';


class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key key}) : super(key: key);

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  Widget _settingsFloatingButton(){// registration button
      return FloatingActionButton(
        child: Text('设置', style: TextStyle(letterSpacing: 2.0,),),
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        onPressed: (){
          // TODO: Registaration page navigation
          print('Salam From Personal Page!');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (BuildContext context) => RegisterationPage()),
          // );
        }
      );
    }
  Widget _lineDividerCSS(){
    return Divider(
      color: Colors.grey[800],
      height: 60.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: Text('Personal Information'),
          backgroundColor: Colors.grey[850],
          centerTitle: true,
        ),

      body: Padding( padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/Images/personal-1.png'),
              ),
            ),
          _lineDividerCSS(),

            Text(//[Label Username]
              '名字', style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(//[Label database Username]
              'K-Taha',style: TextStyle(
                color: Colors.amberAccent[100],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            
            SizedBox(height: 30.0),
            Text(
              '地区',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Wuhan, China',
              style: TextStyle(
                color: Colors.amberAccent[100],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.contact_phone,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  '13125025037',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
            _lineDividerCSS(),
            
            
          ],
        ),
      ),
      floatingActionButton: _settingsFloatingButton(),

    );
  }
}