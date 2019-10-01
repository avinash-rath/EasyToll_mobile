import 'package:easy_toll/screens/home_page.dart';
import 'package:easy_toll/utils/config.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TollgatesAnimation extends StatelessWidget {

  makeFalse() async {
    http.Response response = await http.get(falsePay);
    if(response.statusCode == 200) {
      String respString = response.body;
      print(respString);
    }
  }

  @override
  Widget build(BuildContext context) {
    makeFalse();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 400.0,
            width: 400.0,
            child: FlareActor(
              'assets/go.flr',
              animation: 'start',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Good to Go!', style: TextStyle(
              color: Colors.white,
              fontSize: 30.0
            ),),
          ),
          RaisedButton(
            color: Colors.white,
            shape: StadiumBorder(),
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (BuildContext context) => HomePage()
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
