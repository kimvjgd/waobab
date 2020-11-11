import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';


MapType map_type = MapType.normal;


class MapScreen extends StatefulWidget {
  static final CameraPosition _initialPosition =
  CameraPosition(target: LatLng(37.563713, 126.936924), zoom: 100);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> allMarkers = [];
  GoogleMapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(36.768154, 126.217091)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SizedBox(
            child:
            Stack(alignment: AlignmentDirectional.topStart, children: [
              Container(
                child: GoogleMap(
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  gestureRecognizers:
                  <Factory<OneSequenceGestureRecognizer>>[
                    new Factory<OneSequenceGestureRecognizer>(
                          () => new EagerGestureRecognizer(),
                    ),
                  ].toSet(),
                  mapType: map_type,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(36.768154, 126.217091), zoom: 12.0),
                  markers: Set.from(allMarkers),
                  onMapCreated: mapCreated,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: InkWell(
                  onTap: movetoWaterStation,
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green),
                    child: Icon(Icons.replay, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: otherFunction,
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red),
                    child: Icon(Icons.terrain, color: Colors.white),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
  movetoWaterStation() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(36.768154, 126.217091), zoom: 12.0),
    ));
  }

  otherFunction() {
    if (map_type == MapType.normal) {
      map_type = MapType.terrain;
    } else if (map_type == MapType.terrain) {
      map_type = MapType.satellite;
    } else if (map_type == MapType.satellite) {
      map_type = MapType.normal;
    }
    setState(() {});
  }
}





















