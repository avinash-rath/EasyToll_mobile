import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  int grpValue, proValue;

  String _languagesKnown, _bio, _email, _password, _fname, _lname;

  bool _isObscured = true;
  bool _isChecked = false;
  Color _eyeButtonColor = Colors.grey;

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        'SignUp',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

  Container buildRegisterBottomLine() {
    return Container(
      margin: EdgeInsets.only(right: 315.0),
      height: 1.5,
      width: 22.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.black),
    );
  }

  Container buildCompanyBottomLine() {
    return Container(
      margin: EdgeInsets.only(
        left: 165.0,
        right: 150.0,
      ),
      height: 1.5,
      width: 22.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.black),
    );
  }

  void gender(int g) {
    setState(() {
      if (g == 1) {
        grpValue = 1;
      } else if (g == 2) {
        grpValue = 2;
      }
    });
  }

  Row buildSelectGender() {
    return Row(
      children: <Widget>[
        Container(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: RadioListTile(
                activeColor: Colors.blue,
                title: Text('Male'),
                groupValue: grpValue,
                value: 1,
                onChanged: (int g) => gender(g),
              ),
            ),
          ),
        ),
        Container(
          child: Expanded(
            child: RadioListTile(
              activeColor: Colors.blue,
              title: Text('Female'),
              groupValue: grpValue,
              value: 2,
              onChanged: (int g) => gender(g),
            ),
          ),
        ),
      ],
    );
  }

  void pro(int p) {
    setState(() {
      if (p == 1) {
        proValue = 1;
      } else if (p == 2) {
        proValue = 2;
      } else if (p == 3) {
        proValue = 3;
      }
    });
  }

  Column buildProfeciancy() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            child: RadioListTile(
              activeColor: Colors.blue,
              title: Text('Entry'),
              groupValue: proValue,
              value: 1,
              onChanged: (int p) => pro(p),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            child: RadioListTile(
              activeColor: Colors.blue,
              title: Text('Intermediate'),
              groupValue: proValue,
              value: 2,
              onChanged: (int p) => pro(p),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            child: RadioListTile(
              activeColor: Colors.blue,
              title: Text('High'),
              groupValue: proValue,
              value: 3,
              onChanged: (int p) => pro(p),
            ),
          ),
        ),
      ],
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: FlatButton(
          splashColor: Colors.white,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();

              Navigator.of(context).pushNamed('/home');
            }
          },
          color: Colors.grey[900],
          child: Text(
            'Sign up',
            style: Theme.of(context).primaryTextTheme.button,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (fname) => _fname = fname,
      validator: (fname) {
        if (fname.isEmpty) {
          return 'First Name Required*';
        } else if (fname.length < 15) {
          return 'Limit exceed*';
        }
      },
      decoration: InputDecoration(
          hintText: 'eg: John',
          labelText: 'First Name',
          icon: Icon(Icons.person)),
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (lname) => _lname = lname,
      validator: (lname) {
        if (lname.isEmpty) {
          return 'Company name required*';
        }
      },
      decoration: InputDecoration(
          hintText: 'eg: Mike',
          labelText: 'Last Name',
          icon: Icon(Icons.perm_identity)),
    );
  }

  TextFormField buildLanguagesKnown() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (langKnown) => _languagesKnown = langKnown,
      validator: (langKnown) {
        if (langKnown.isEmpty) {
          return 'Area required*';
        }
      },
      decoration: InputDecoration(
          labelText: 'Languages known', icon: Icon(Icons.language)),
    );
  }

  TextFormField buildLocationTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      // onSaved: (street) => _street = street,
      // validator: (street) {
      //   if (street.isEmpty) {
      //     return 'Street required*';
      //   }
      // },
      decoration: InputDecoration(
          hintText: '#12020 circle street',
          labelText: 'Location',
          icon: Icon(Icons.my_location)),
    );
  }

  TextFormField buildBioTextArea() {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLines: 1,
      // maxLength: 6,
      onSaved: (bio) => _bio = bio,
      validator: (bio) {
        if (bio.isEmpty) {
          return 'Postal code required*';
        } else if (bio.length < 6) {
          return 'Postal code must have 6 char*';
        }
      },

      decoration:
          InputDecoration(labelText: 'Bio', icon: Icon(Icons.library_books)),
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 6,
      onSaved: (passwordInput) => _password = passwordInput,
      validator: (passwordInput) {
        if (passwordInput.isEmpty) {
          return 'Password Invalid';
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '********',
        icon: Icon(Icons.lock_open),
        suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye, color: _eyeButtonColor),
            onPressed: () {
              if (_isObscured) {
                setState(() {
                  _isObscured = false;
                  _eyeButtonColor = Theme.of(context).primaryColor;
                });
              } else {
                setState(() {
                  _isObscured = true;
                  _eyeButtonColor = Colors.grey;
                });
              }
            }),
      ),
      obscureText: _isObscured,
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      onSaved: (emailInput) => _email = emailInput,
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Invalid Email';
        }
      },
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'xyz@mail.com',
          icon: Icon(Icons.alternate_email)),
    );
  }

  FlatButton buildAlreadySignedUp() {
    return FlatButton(
      child: Text('Already Signed up? Login here'),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  //----------------------------Designation -----------------------------------------------------
  var _currentItem = 'Bangalore';
  var _designation = [
    'Bangalore',
    'Chennai',
    'Hydrabad',
  ];

  DropdownButton buildDropdownButton() {
    return DropdownButton<String>(
      isExpanded: true,
      elevation: 0,
      iconDisabledColor: Colors.grey,
      iconEnabledColor: Colors.black,
      items: _designation.map((String dropDowntringItem) {
        return DropdownMenuItem<String>(
          value: dropDowntringItem,
          child: Text(dropDowntringItem),
        );
      }).toList(),
      onChanged: (String newValueSelected) {
        setState(() {
          this._currentItem = newValueSelected;
        });
      },
      value: _currentItem,
    );
  }

//----------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 22.0),
            children: <Widget>[
              SizedBox(height: kToolbarHeight),
              buildTitle(),

              // buildRegisterBottomLine(),
              // buildCompanyBottomLine(),
              SizedBox(
                height: 30.0,
              ),
              buildFirstNameField(),
              buildLastNameField(),
              buildSelectGender(),
              buildLanguagesKnown(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Your Proficiency',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              buildProfeciancy(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.location_city,color: Colors.grey,),
                  ),
                  Expanded(flex: 1, child: buildDropdownButton()),
                ],
              ),

              buildBioTextArea(),
              buildEmailTextField(),
              buildPasswordTextField(),
              SizedBox(
                height: 30.0,
              ),
              buildLoginButton(context),
              buildAlreadySignedUp(),
            ],
          ),
        ),
      ),
    );
  }
}