import 'package:easy_toll/screens/home_page.dart';
import 'package:easy_toll/screens/payment_ack.dart';
import 'package:easy_toll/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  String paymentDue;

  @override
  void initState() {
    super.initState();
    paymentDue = 'Rs. 10.00';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/curvedRect.png',
            fit: BoxFit.contain,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 75,
            ),
            child: Text(
              '$paymentDue',
              style: TextStyle(fontSize: 75.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              'Payment Due',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              elevation: 5.0,
              color: Color(0xFF3cc2bb),
              minWidth: 500.0,
              height: 75.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: () async {
                // TODO: call tollPay API
                http.Response response = await http.get('$tollPayUrl');
                if (response.statusCode == 200) {
                  String respString = response.body;
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                    builder: (BuildContext context) => PaymentAck(
                      transactionHash: respString,
                    ),
                  ));
                }
              },
              child: Text(
                'Pay Now',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (BuildContext context) => HomePage(),
                ),
              );
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.red.withOpacity(0.75), fontSize: 25.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
