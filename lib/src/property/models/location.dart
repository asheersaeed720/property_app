class LocationModel {
  LocationModel({
    this.id,
    this.name,
    this.lat,
    this.long,
    this.createdAt,
    //extra
  });

  String? id;
  String? name;
  String? lat;
  String? long;
  DateTime? createdAt;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        name: json["name"],
        lat: json["lat"],
        long: json["long"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lat": lat,
        "long": long,
        "created_at": createdAt?.toIso8601String(),
      };
}
