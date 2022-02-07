class ComplaintCategory {
  ComplaintCategory({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory ComplaintCategory.fromJson(Map<String, dynamic> json) => ComplaintCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
