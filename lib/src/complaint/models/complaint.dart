class ComplaintModel {
  ComplaintModel({
    this.id,
    this.userId,
    this.categoryId,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.category,
    this.user,
  });

  String? id;
  String? userId;
  String? categoryId;
  String? title;
  String? description;
  String? status;
  DateTime? createdAt;
  String? category;
  String? user;

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        category: json["category"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "title": title,
        "description": description,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "category": category,
        "user": user,
      };
}
