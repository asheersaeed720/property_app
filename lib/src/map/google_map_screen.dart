import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  static const String routeName = '/google-map';

  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(24.9008, 67.1681),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Google map screen'),
      // body: GetBuilder<PropertyController>(
      //   init: PropertyController(),
      //   builder: (propertyController) => FutureBuilder<List<PropertyModel>>(
      //     future: propertyController.getAllProperties(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasError) {
      //         List<PropertyModel> propertiesList = snapshot.data ?? [];
      //         log('propertiesList $propertiesList');

      //         for (var element in propertiesList) {
      //           _markers.add(
      //             Marker(
      //               markerId: MarkerId('${element.lat}${element.long}'),
      //               icon: BitmapDescriptor.defaultMarker,
      //               position: LatLng(
      //                 double.parse('${element.lat}'),
      //                 double.parse('${element.long}'),
      //               ),
      //               infoWindow: const InfoWindow(title: "Location"),
      //             ),
      //           );
      //         }
      //         log('_markers $_markers');
      //         return Stack(
      //           clipBehavior: Clip.none,
      //           children: [
      //             GoogleMap(
      //               mapType: MapType.normal,
      //               initialCameraPosition: _kGooglePlex,
      //               markers: _markers,
      //               onMapCreated: (GoogleMapController controller) {
      //                 _controller.complete(controller);
      //               },
      //             ),
      //             Positioned(
      //               top: 52.0,
      //               left: 18.0,
      //               child: InkWell(
      //                 onTap: () {
      //                   Get.back();
      //                 },
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                       color: Colors.white, borderRadius: BorderRadius.circular(32.0)),
      //                   padding: const EdgeInsets.all(10.0),
      //                   child: const Icon(Icons.arrow_back_ios_new_rounded),
      //                 ),
      //               ),
      //             )
      //           ],
      //         );
      //       }
      //       return const LoadingWidget();
      //     },
      //   ),
      // ),
    );
  }
}
