import 'package:easy_toll/screens/payment_ack.dart';
import 'package:easy_toll/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PrePaid extends StatefulWidget {
  @override
  _PrePaidState createState() => _PrePaidState();
}

class _PrePaidState extends State<PrePaid> {
  final LatLng _center = const LatLng(12.9716, 77.5946);
  int noOfTolls = 2;
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final locs = [
      Loc('PES', 12.861258, 77.664512),
      Loc(
        'KIA Toll',
        13.202432,
        77.701989,
      ),
    ];
    setState(() {
      _markers.clear();
      for (final loc in locs) {
        final marker = Marker(
          markerId: MarkerId(loc.name),
          position: LatLng(loc.lat, loc.lng),
          infoWindow: InfoWindow(
              title: loc.name,
              snippet: loc.name,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Details!',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        content: Text(
                            'Toll name : ${loc.name}\nLocation : ${loc.lat},${loc.lng}'),
                      );
                    });
              }),
        );
        _markers[loc.name] = marker;
      }
    });
  }

  payMultiple() async {
    http.Response response = await http.get(tollPayMultiple);
    if (response.statusCode == 200) {
      String transactionHash = response.body;
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (BuildContext context) => PaymentAck(
                transactionHash: transactionHash,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Prepaid Payments',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          LimitedBox(
            maxHeight: MediaQuery.of(context).size.height / 2,
            maxWidth: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.5,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: _markers.values.toSet(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'There are $noOfTolls tolls on the way.',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              padding: EdgeInsets.all(10.0),
              color: Colors.lightBlueAccent,
              shape: StadiumBorder(),
              child: Text(
                'Pay Now!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0
                ),
              ),
              onPressed: () {
                payMultiple();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.redAccent, fontSize: 25.0),
            ),
          )
        ],
      ),
    );
  }
}

class Loc {
  String name;
  double lat;
  double lng;

  Loc(
    this.name,
    this.lat,
    this.lng,
  );
}
