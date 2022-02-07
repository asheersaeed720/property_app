import 'dart:io';

import 'package:get/get.dart';
import 'package:property_app/src/event/event.dart';
import 'package:property_app/src/event/event_service.dart';

class EventController extends GetxController {
  final _eventService = Get.put(EventService());

  Future<List<EventModel>> getAllEvents() async {
    try {
      var response = await _eventService.getAllEvents();
      if (response.statusCode == 200) {
        var responseJson = response.body;
        return (responseJson as List).map((i) => EventModel.fromJson(i)).toList();
      } else {
        throw ('Failed to load Events');
      }
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }
}
