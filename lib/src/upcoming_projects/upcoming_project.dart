class UpcomingProjectModel {
  UpcomingProjectModel({
    this.id,
    this.name,
    this.description,
    this.locationId,
    this.completionDate,
    this.completed,
    this.extraInfo,
    this.createdAt,
    this.images,
  });

  String? id;
  String? name;
  String? description;
  String? locationId;
  DateTime? completionDate;
  String? completed;
  List<ExtraInfo>? extraInfo;
  DateTime? createdAt;
  List<UpcomingProjectImage>? images;

  factory UpcomingProjectModel.fromJson(Map<String, dynamic> json) => UpcomingProjectModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        locationId: json["location_id"],
        completionDate: DateTime.parse(json["completion_date"]),
        completed: json["completed"],
        extraInfo: List<ExtraInfo>.from(json["extra_info"].map((x) => ExtraInfo.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        images: List<UpcomingProjectImage>.from(
            json["images"].map((x) => UpcomingProjectImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location_id": locationId,
        "completion_date":
            "${completionDate?.year.toString().padLeft(4, '0')}-${completionDate?.month.toString().padLeft(2, '0')}-${completionDate?.day.toString().padLeft(2, '0')}",
        "completed": completed,
        "extra_info": List<dynamic>.from(extraInfo!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "images": List<UpcomingProjectImage>.from(images!.map((x) => x.toJson())),
      };
}

class ExtraInfo {
  ExtraInfo({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory ExtraInfo.fromJson(Map<String, dynamic> json) => ExtraInfo(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class UpcomingProjectImage {
  UpcomingProjectImage({
    this.id,
    this.projectId,
    this.image,
    this.title,
  });

  String? id;
  String? projectId;
  String? image;
  String? title;

  factory UpcomingProjectImage.fromJson(Map<String, dynamic> json) => UpcomingProjectImage(
        id: json["id"],
        projectId: json["project_id"],
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_id": projectId,
        "image": image,
        "title": title,
      };
}
