import 'dart:io';

import 'package:get/get.dart';
import 'package:property_app/src/upcoming_projects/project_service.dart';
import 'package:property_app/src/upcoming_projects/upcoming_project.dart';

class ProjectController extends GetxController {
  final _projectService = Get.put(ProjectService());

  Future<List<UpcomingProjectModel>> getAllProjects() async {
    try {
      var response = await _projectService.getAllProjects();
      // log(response.body);
      if (response.statusCode == 200) {
        var responseJson = response.body;
        return (responseJson as List).map((i) => UpcomingProjectModel.fromJson(i)).toList();
      } else {
        throw ('Failed to load Projects');
      }
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }
}
