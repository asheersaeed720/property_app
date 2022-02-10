import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_app/src/property/models/location.dart';
import 'package:property_app/src/property/property_model.dart';
import 'package:property_app/src/property/property_service.dart';

class PropertyController extends GetxController {
  final _propertyService = Get.put(PropertyService());

  bool isLoading = false;

  bool emptyListLoading = true;

  final Set<Marker> markers = {};

  List<PropertyModel> propertiesList = [];

  List<LocationModel> locationList = [];

  ScrollController controller = ScrollController();

  LocationModel locationForm = LocationModel();

  RxInt interface = 0.obs;
  RxInt searchBounce = 0.obs;

  @override
  void onInit() async {
    await getAllProperties();
    getLocations();
    debounce(
      interface,
      (_) async {
        await getAllProperties();
      },
      time: const Duration(seconds: 2),
    );
    controller.addListener(scrollUpdate);
    ever(interface, (value) {
      isLoading = true;
      update();
    });
    addMarker();
    super.onInit();
  }

  scrollUpdate() async {
    if (controller.position.maxScrollExtent == controller.position.pixels) {
      interface++;
    }
  }

  Future<void> getLocations() async {
    try {
      isLoading = true;
      update();
      var response = await _propertyService.getLocations();
      if (response.statusCode == 200) {
        locationList.addAll(
          ((response.body as List).map((i) => LocationModel.fromJson(i)).toList()),
        );
      }
      isLoading = false;
      update();
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getAllProperties() async {
    try {
      isLoading = true;
      update();
      var response = await _propertyService.getAllProperties(propertiesList.length);
      if (response.statusCode == 200) {
        if (([response.body]).isEmpty) {
          controller.removeListener(scrollUpdate);
        }
        propertiesList.addAll(
          ((response.body as List).map((i) => PropertyModel.fromJson(i)).toList()),
        );
      } else {
        throw ('Something went wrong ${response.body}');
      }
      emptyListLoading = false;
      isLoading = false;
      update();
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PropertyModel>> getSearchableProperties(String userId) async {
    try {
      var response = await _propertyService.getSearchableProperties(userId);
      log(response.body.toString());
      if (response.statusCode == 200) {
        var responseJson = response.body;
        return (responseJson as List).map((i) => PropertyModel.fromJson(i)).toList();
      } else {
        throw ('Failed to load Properties');
      }
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }

  addMarker() {
    for (var element in propertiesList) {
      markers.add(
        Marker(
          markerId: MarkerId('${element.lat}${element.long}'),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(
            double.parse('${element.lat}'),
            double.parse('${element.long}'),
          ),
          infoWindow: const InfoWindow(title: "Location"),
        ),
      );
    }
    update();
  }
}
