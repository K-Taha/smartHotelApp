

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import 'login_screen.dart';

class RegisterationPage extends StatefulWidget {
  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  String _name;
  String _phone;
  String _password;
  String _conformPassword;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userphoneController = TextEditingController();
  final _conformPasswordController = TextEditingController();
  final _listofpetsController = TextEditingController();
  
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final listOfPets = ["Face ID", "Finger ID", "PIN"];
  String  dropdownValue = 'PIN';
  
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

    Widget _buildPhone() {// password TextField
      return TextFormField(
        controller: _userphoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(labelText: 'Phone', prefixIcon: Icon(Icons.phone), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),)),
        maxLength: 11,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone is Required!';
          
          }
          return null;
        },
        onSaved: (String value) {
          _phone = value;
        },
      );
  }// _buildName()
    //TODO: add condition for [faceID - fingerID- PIN]
    // Widget _buildPassword() {// password TextField
    //   return TextFormField(
    //     controller: _passwordController,
    //     decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.vpn_key), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),)),
    //     obscureText: true,
    //     validator: (String value) {
    //       if (value.isEmpty) {
    //         return 'Password is Required!';
    //       } return null;
    //     },
    //     onSaved: (String value) {
    //       _password = value;
    //     },
    //   );
    // }// _buildPassword()

    // Widget _buildCoformPassword() {// password TextField
    //   return TextFormField(
    //     controller: _conformPasswordController,
    //     decoration: InputDecoration(labelText: 'Conform', prefixIcon: Icon(Icons.vpn_key), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),)),
    //     obscureText: true,
    //     validator: (String value) {
    //       if (value.isEmpty) {
    //         return 'Conforming is Required!';
    //       }else if(value.isNotEmpty && _conformPasswordController.value != _passwordController.value){
    //         return 'Conforming is not matching!';
    //       }
    //        return null;
    //     },
    //     onSaved: (String value) {
    //       _conformPassword = value;
    //     },
    //   );
    // }// _buildCoformPassword()
    
    Widget _vuildDropdownButtonFormField(){// drop down button
           return DropdownButtonFormField(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              decoration: InputDecoration(labelText: "Registaration Type", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
              ),
              items: listOfPets.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  //TODO: add function for database 
                });
              },
              validator: (value) {
                if (value.isEmpy) {
                  return 'Please Select Type!';
                }
                return null;
              },
            );
          }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Form(
          key: _formKey,
          child: ListView(padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>
            [ 
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                
                children: <Widget>
                [ //[ Icon & and title]
                  Container(
                    // color: kShrinePink300,  
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    child: Text('Registration ', style: Theme.of(context).textTheme.headline, textAlign:TextAlign.center ,),
                  ),

                ],
              ),

              
              AccentColorOverride(//[username]
                color: kShrineAltDarkGrey, 
                child: _buildName(),
              ),
              SizedBox(height: 12.0),
              
              AccentColorOverride(//[Phone] 
                color: kShrineAltDarkGrey, 
                child: _buildPhone(),
              ),
              SizedBox(height: 12.0),

              // AccentColorOverride(//[Password]
              //   color: kShrineAltDarkGrey, 
              //   child: _buildPassword(),
              // ),
              // SizedBox(height: 12.0),

              // AccentColorOverride(//[ Conform Password]
              //   color: kShrineAltDarkGrey, 
              //   child: _buildCoformPassword(),
              // ),
              // SizedBox(height: 12.0),

              AccentColorOverride(//[dropdownbutton]
              color: kShrineAltDarkGrey, 
              child: _vuildDropdownButtonFormField()
              ),
              SizedBox(height: 12.0),

              ButtonBar(
                children: <Widget>
                [
                  FlatButton(//[Cancel FlatButton]
                    child: Text('CANCEL'),
                    textColor: kShrineAltDarkGrey,
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                      _conformPasswordController.clear();
                      _userphoneController.clear();
                      setState(() {
                        dropdownValue = 'PIN';
                      });
                      // newValue = 'PIN';
                      // _listofpetsController.clear();
                      // print(_listofpetsController);
                       
                    },
                  ),
                  SizedBox(height: 120),

                  RaisedButton(//[Save RaisedButton]
                    child: Text('NEXT'),
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    elevation: 8.0,
                    onPressed: () {
                      if(!_formKey.currentState.validate()){
                        return;
                      } 
                        _formKey.currentState.save();
                        print(_name);
                        print(_phone);
                        print(_password);
                        print(_conformPassword);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => FormScreen()),
                        );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {//[Color class From colors.dart]
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