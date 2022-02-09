import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_app/src/property/property_model.dart';
import 'package:property_app/src/property/property_service.dart';

class PropertyController extends GetxController {
  final _propertyService = Get.put(PropertyService());

  bool isLoading = false;

  final Set<Marker> markers = {};

  List<PropertyModel> propertiesList = [];

  ScrollController controller = ScrollController();

  RxInt interface = 0.obs;
  RxInt searchBounce = 0.obs;

  @override
  void onInit() {
    getAllProperties();
    debounce(
      interface,
      (_) async {
        await getAllProperties();
      },
      time: const Duration(seconds: 2),
    );
    controller.addListener(scrollUpdate);
    super.onInit();
  }

  scrollUpdate() async {
    if (controller.position.maxScrollExtent == controller.position.pixels) {
      interface++;
    }
  }

  Future<void> getAllProperties() async {
    try {
      isLoading = true;
      update();
      var response = await _propertyService.getAllProperties(propertiesList.length);
      log('${response.body}', name: 'response');
      // if (response.statusCode == 200) {
      //   var responseJson = response.body;
      //   return (responseJson as List).map((i) => PropertyModel.fromJson(i)).toList();
      // } else {
      //   throw ('Failed to load Properties');
      // }
      if (response.statusCode == 200) {
        if (([response.body]).isEmpty) {
          controller.removeListener(scrollUpdate);
        }
        propertiesList.addAll(
          ((response.body as List).map((i) => PropertyModel.fromJson(i)).toList()),
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

  // Future<List<PropertyModel>> getSearchableProperties() async {
  //   try {
  //     var response = await _propertyService.getSearchableProperties();
  //     if (response.statusCode == 200) {
  //       var responseJson = response.body;
  //       return (responseJson as List).map((i) => PropertyModel.fromJson(i)).toList();
  //     } else {
  //       throw ('Failed to load Properties');
  //     }
  //   } on SocketException {
  //     throw ('No Internet connection');
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
