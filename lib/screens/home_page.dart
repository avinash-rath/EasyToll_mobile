import 'dart:convert';

import 'package:easy_toll/screens/login.dart';
import 'package:easy_toll/screens/payments.dart';
import 'package:easy_toll/screens/prepaid.dart';
import 'package:easy_toll/utils/config.dart';
import 'package:easy_toll/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future balance;
  String accountAddress;
  int noOfRidesUntilReward = 15;
  List<PaymentHistory> list = [
    PaymentHistory(
        userAddress: '0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1',
        paymentAmount: '\$0.45',
        paymentLocation: '79.00045623, 81.12345678',
        tollName: 'PESIT TollGate'),
    PaymentHistory(
        userAddress: '0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1',
        paymentAmount: '\$0.55',
        paymentLocation: '79.00045623, 81.12345678',
        tollName: 'PESIT TollGate'),
    PaymentHistory(
        userAddress: '0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1',
        paymentAmount: '\$0.15',
        paymentLocation: '79.00045623, 81.12345678',
        tollName: 'PESIT TollGate'),
    PaymentHistory(
        userAddress: '0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1',
        paymentAmount: '\$1.00',
        paymentLocation: '79.00045623, 81.12345678',
        tollName: 'PESIT TollGate'),
    PaymentHistory(
        userAddress: '0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1',
        paymentAmount: '\$0.69',
        paymentLocation: '79.00045623, 81.12345678',
        tollName: 'PESIT TollGate'),
  ];

  getBalance() async {
    http.Response response = await http.get('$getBalanceUrl');
    if (response.statusCode == 200) {
      var collection = json.decode(response.body);
      String balance = collection['balance'].toString();
      print(balance);
      print(collection.toString());
      return balance;
    }
  }

  @override
  void initState() {
    super.initState();
    accountAddress = '0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1';
    balance = getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (BuildContext context) => LoginPage()
              )
            );
          },
        )],
        backgroundColor: Colors.white,
        elevation: 10.0,
        centerTitle: true,
        title: Text(
          'EasyToll',
          style: TextStyle(color: Colors.black),
        ),
        // actions: <Widget>[],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 22.0, left: 15.0),
            child: Text(
              'Balance',
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 1.0),
            child: FutureBuilder(
                future: balance,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  switch (snap.connectionState) {
                    case ConnectionState.none:

                    case ConnectionState.waiting:

                    case ConnectionState.active:
                      return CircularProgressIndicator();
                      break;
                    case ConnectionState.done:
                      if (snap.hasData) {
                        return Text(
                          'Rs. ${snap.data}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 1.5,
                            fontSize: 75.0,
                          ),
                        );
                      }
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 15.0),
            child: Text(
              'Account Addr.',
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
          ),
          FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Your Account Address is ',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      content: Text('$accountAddress'),
                    );
                  });
            },
            child: Text(
              '$accountAddress',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              elevation: 5.0,
              color: Color(0xFF3cc2bb),
              minWidth: 500.0,
              height: 50.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.zero,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (BuildContext context) => PrePaid(),
                  ),
                );
              },
              child: Text(
                'Choosing Prepaid?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Next Reward in $noOfRidesUntilReward rides',
              style: TextStyle(color: Color(0xFF3cc2bb), fontSize: 16.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 15.0,bottom: 5),
            child: Text(
              'Payment History',
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length ?? 5,
              itemBuilder: (BuildContext context, int count) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: boxShadows,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 100.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Payment done : ${list[count].paymentAmount}',
                              style: TextStyle(color: Color(0xFF3cc2bb), fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0,),
                            Text('Toll Booth : ${list[count].tollName}'),
                            Text('Toll Location : ${list[count].paymentLocation}')
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('tapped');
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (BuildContext context) => PaymentsPage(),
            ),
          );
        },
        splashColor: Colors.transparent,
        highlightElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.00,
        child: Icon(
          Icons.edit,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class PaymentHistory {
  String userAddress;
  String paymentLocation;
  String tollName;
  String paymentAmount;

  PaymentHistory({
    this.paymentAmount,
    this.paymentLocation,
    this.tollName,
    this.userAddress,
  });
}
