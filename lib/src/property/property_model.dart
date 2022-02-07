class PropertyModel {
  PropertyModel({
    this.id,
    this.name,
    this.description,
    this.typeId,
    this.locationId,
    this.price,
    this.lat,
    this.long,
    this.status,
    this.createdAt,
    this.type,
    this.location,
    this.images,
  });

  String? id;
  String? name;
  String? description;
  String? typeId;
  String? locationId;
  String? price;
  String? lat;
  String? long;
  String? status;
  DateTime? createdAt;
  String? type;
  String? location;
  List<PropertyImage>? images;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        typeId: json["type_id"],
        locationId: json["location_id"],
        price: json["price"],
        lat: json["lat"],
        long: json["long"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        type: json["type"],
        location: json["location"],
        images: List<PropertyImage>.from(json["images"].map((x) => PropertyImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type_id": typeId,
        "location_id": locationId,
        "price": price,
        "lat": lat,
        "long": long,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "type": type,
        "location": location,
        "images": List<PropertyImage>.from(images!.map((x) => x.toJson())),
      };
}

class PropertyImage {
  PropertyImage({
    this.id,
    this.propertyId,
    this.image,
    this.title,
  });

  String? id;
  String? propertyId;
  String? image;
  String? title;

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
        id: json["id"],
        propertyId: json["property_id"],
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_id": propertyId,
        "image": image,
        "title": title,
      };
}
