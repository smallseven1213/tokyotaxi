import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController locationController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.681683, 139.767477),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onLongPress: (LatLng latLng) {
              var markerIdVal = new DateTime.now().millisecondsSinceEpoch.toString();
              final MarkerId markerId = MarkerId(markerIdVal);

              // creating a new MARKER
              final Marker marker = Marker(
                markerId: markerId,
                position: latLng,
                infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
              );

              setState(() {
                // adding a new marker to map
                markers.clear();
                markers[markerId] = marker;
              });
            }
          ),
          Positioned(
            bottom: 50.0,
            left: 15.0,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () => {
                Navigator.pushNamed(context, '/second')
              },
              child: Icon(Icons.account_circle),
            ),
          ),
          Positioned(
            top: 50.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 55.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: locationController,
                decoration: InputDecoration(
                  icon: Container(margin: EdgeInsets.only(left: 20, top: 5), width: 10, height: 10, child: Icon(Icons.location_on, color: Colors.black,),),
                  hintText: "請輸入地址",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
