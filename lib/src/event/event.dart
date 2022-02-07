class EventModel {
  EventModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.extraInfo,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? description;
  String? image;
  List<ExtraInfo>? extraInfo;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        extraInfo: List<ExtraInfo>.from(json["extra_info"].map((x) => ExtraInfo.fromJson(x))),
        date: DateTime.parse(json["date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "extra_info": List<dynamic>.from(extraInfo!.map((x) => x.toJson())),
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
