import 'package:flutter/material.dart';
import 'package:smart_hotel/colors.dart';
import 'package:smart_hotel/screens/home_screen.dart';
import 'package:smart_hotel/screens/registeration_screnn.dart';


class FormScreen extends StatefulWidget {
  FormScreen({Key key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  
  String _name;
  String _password;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
    Widget _buildName() {// password TextField
      return TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: 'Username', prefixIcon: Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),)),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Username is Required!';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      );
  }// _buildName()

    Widget _buildPassword() {// password TextField
      return TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.vpn_key), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),)),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required!';
          } return null;
        },
        onSaved: (String value) {
          _password = value;
        },
      );
    }// _buildPassword()

    Widget _registerationFloatingButton(){// registration button
      return FloatingActionButton(
        child: Text('NEW'),
        elevation: 0.0,
        onPressed: (){
          // TODO: Registaration page navigation
          print('Salam From new Rigisteration!');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => RegisterationPage()),
          );
        }
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child:  ListView(padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: ListView(padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>
            [ 
              Column(
                children: <Widget>
                [ //[ Icon & and title]
                  SizedBox(height: 80.0), 
                  Image.asset(
                    'assets/diamond.png', 
                    color: kShrineAltDarkGrey,
                    ),
                  SizedBox(height: 16.0),
                  Text(
                    'Smart Hotel',
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(height: 120.0),
                ],
              ),

              //[username]
              AccentColorOverride(
                color: kShrineAltDarkGrey, 
                child: _buildName(),
              ),

              SizedBox(height: 12.0),

              //[Password]
              AccentColorOverride(
                color: kShrineAltDarkGrey, 
                child: _buildPassword(),
              ),
              
              SizedBox(height: 12.0),

              ButtonBar(
                children: <Widget>
                [// [cancel &save ]
                  FlatButton(
                    child: Text('CANCEL'),
                    textColor: kShrineAltDarkGrey,
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                  ),

                  SizedBox(height: 16.0),

                  RaisedButton(
                    elevation: 8.0,
                    child: Text('NEXT'),
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    onPressed: () {
                      if(!_formKey.currentState.validate()){
                        return;
                      } 
                      _formKey.currentState.save();
                      print(_name);
                      print(_password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                      );
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _registerationFloatingButton(),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
    : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.light
      ),
    );
  }
}
