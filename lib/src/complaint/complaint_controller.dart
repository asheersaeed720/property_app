import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:property_app/src/complaint/complaint_service.dart';
import 'package:property_app/src/complaint/models/complaint.dart';
import 'package:property_app/src/complaint/models/complaint_category.dart';

class ComplaintController extends GetxController {
  final _complainService = Get.put(ComplaintService());

  List<ComplaintCategory> complaintCategoryList = [];

  @override
  void onInit() {
    getComplaintCategory();
    super.onInit();
  }

  Future<List<ComplaintCategory>> getComplaintCategory() async {
    try {
      var response = await _complainService.getComplaintCategory();
      log('${response.body}');
      if (response.statusCode == 200) {
        var responseJson = response.body;
        for (var element in (responseJson as List)) {
          complaintCategoryList.add(ComplaintCategory.fromJson(element));
        }
        update();
        return (responseJson).map((i) => ComplaintCategory.fromJson(i)).toList();
      } else {
        throw ('Failed to load complaints categories');
      }
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ComplaintModel>> getUserComplaint() async {
    try {
      var response = await _complainService.getUserComplaint();
      log('${response.body}');
      if (response.statusCode == 200) {
        var responseJson = response.body;
        return (responseJson as List).map((i) => ComplaintModel.fromJson(i)).toList();
      } else {
        throw ('Failed to load Complaints');
      }
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createComplaint({
    String complaintTitleTxt = '',
    String complaintDesc = '',
    String complaintCategory = '1',
  }) async {
    try {
      var response = await _complainService.createComplaint(
        complaintTitleTxt,
        complaintDesc,
        complaintCategory,
      );

      if (response.statusCode == 200) {
        log('${response.body}');
      } else {
        log('${response.body}');
      }
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }
}
