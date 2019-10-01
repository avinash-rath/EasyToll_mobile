import 'package:easy_toll/screens/tollgates_open.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentAck extends StatefulWidget {
  final String transactionHash;

  PaymentAck({this.transactionHash});
  @override
  _PaymentAckState createState() => _PaymentAckState();
}

class _PaymentAckState extends State<PaymentAck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 400.0,
            height: 400.0,
            child: FlareActor(
              'assets/done_check_with_reverse.flr',
              fit: BoxFit.contain,
              animation: 'play',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Transaction Hash',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '${widget.transactionHash}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            )),
            padding: EdgeInsets.only(
              right: 40.0,
              left: 40.0,
              top: 10.0,
              bottom: 30.0,
            ),
            color: Color(0xFF3cc2bb),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (BuildContext context) => TollgatesAnimation()
                )
              );
            },
            child: Text(
              'Okay!',
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
          ),
        ],
      ),
    );
  }
}
